---
title: "Managing Secrets"
description: "Various ways for managing secrets with Cue"
weight: 15
---


### Data Injection

Cue can inject data from the command line into your configurations.

{{< chromaHTML file="code/patterns/secrets/inject.html" title="inject.cue" >}}

```shell
# -t key=value  -e to eval a specific value
$ cue eval inject.cue -t username="someone" -t password="abc123" -e database.dev.conn
"postgres://someone:abc123@postgres.dev:5432/mydb"
```

### Combining Files

You can combine multiple Cue files.
Note how the secret values are structured the same
and the secret file does not have a package name.

{{< chromaDouble
  lhsPath="code/patterns/secrets/app.html" lhsTitle="app.cue"
  rhsPath="code/patterns/secrets/secret.html" rhsTitle="secret.cue"
>}}

```shell
$ cue eval app.cue secret.cue 
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
```
