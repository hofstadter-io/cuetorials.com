---
title: "Managing Secrets"
description: "Various ways for managing secrets with Cue"
weight: 15
---


### Data Injection

Cue can inject data from the command line into your configurations.

{{< codePane file="code/patterns/secrets/inject.html" title="inject.cue" >}}

```shell
# -t key=value  -e to eval a specific value
$ cue eval inject.cue -t username="someone" -t password="abc123" -e database.dev.conn
"postgres://someone:abc123@postgres.dev:5432/mydb"
```

### Combining Files

You can combine multiple Cue files.
Note how the secret values are structured the same
and the secret file does not have a package name.

{{< codePane2
  file1="code/patterns/secrets/app.html" title1="app.cue"
  file2="code/patterns/secrets/secret.html" title2="secret.cue"
>}}

{{<codeInner title="cue eval app.cue secret.cue" >}}
secrets: {
    username: "prd-user"
    password: "prd-pass"
}
app: {
    creds: {
        user: "prd-user"
        pass: "prd-pass"
    }
}
{{< /codeInner >}}
