---
title: "The Case for CUE"
description: "stories and articles about CUE adoption"

weight: 100
draft: True
---

{{<lead>}}
Real stories and articles about CUE adoption.
{{</lead>}}

(would you like to have your story here?
then ...)

- Easing IAM management with Terraform, with CUE
    - set the stage, (TF for GCP IAM)
    - getting unweildly, lots of repetition (show HCL snippit)
    - wanted an identity centric view
    - Fortunately TF also accepts JSON
    - Ideally written like this (show CUE version) 
    - CUE to the rescue (show the flippening)
    - benefits
        - only the ops team needs to know
        - only simple CUE
        - incremental adoption, render to `.tf.json`
    - how can we make `hof/flow` immune to this problem
      (not be rigid to how one can specify a many-to-many relationship (M->N))

service-accounts.tf
```hcl
resource "google_service_account" "jenkins" {
  project = var.project

  account_id   = "jenkins"
  display_name = "jenkins"
  description  = "used by the jenkins system"
}

resource "google_project_iam_binding" "jenkins" {
  project = var.project
  members = [ "serviceAccount:${google_service_account.jenkins.email}" ]
  role = "roles/${ each.key }"
  for_each = toset([
    "compute.admin",
    "compute.serviceAgent",
    "iam.serviceAccountUser",
    "storage.admin",
    "cloudkms.cryptoKeyDecrypter",
    "secretmanager.secretAccessor",
    "ondemandscanning.admin",
    "containeranalysis.admin",
    "artifactregistry.admin",
    "artifactregistry.repoAdmin",
  ])
}
```

service-accounts.cue
```cue
package iam

// some common fields / schema for service accounts
resource: google_service_account: [name=string]: {
  project: #vars.project

  // ensure service account TF name/key matches GCP account_id
  account_id: string | *name

  // set display_name to name by default
  display_name: string | *name

  // convenience hidden field to prevent rendering
  _email: string | *"\(account_id)@\(project).iam.gserviceaccount.com"
}

resource: google_service_account: "devops-bot": {
  _roles: [
    "compute.admin",
    "eventarc.eventReceiver",
  ]
}

resource: google_service_account: "dev-vm-bot": {
  _roles: [
    "compute.admin",
    "storage.objectViewer",
  ]
}
```

`roles.cue`

```cue
package iam

import "strings"

// this file creates role_binding resources
// by iterating over the service accounts

// This is how we flip around the TF organization
// so we can be identity centric, whereas TF is role centric
// (1) we create a large object for easier accumulation in CUE
_roleFlipper: {
  // (1.a) loop over identity centric config
  for sa, SA in resource.google_service_account {
    for _, role in SA._roles {
      // (1.b) become role centric, role accum hierarchy
      (role): members: {
        // (1.c) use key/value rather than list to do member accumulation
        (sa): SA._email
      }
    }
  }
} 

// (2) this is where we create the actual resource for TF
resource: google_project_iam_binding: {
  // (2.a) loop over roles map, creating TF resources
  for r, R in _roleFlipper {
    let name = strings.Replace(r, ".", "-", -1)
    // (2.b) this is the actual TF resource
    (name):  {
      project: #vars.project
      role: "roles/\(r)"
      // (2.c) we turn the members object per role into a list for TF
      members: [ for _, email in R.members { "serviceAccount:\(email)" } ]
    }
  }
}
```
