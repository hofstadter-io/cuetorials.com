package main

import "path"

env:  string
host: string

// urlPath is agnostic of environment
urlPath: "/path/to/asset"

// url is derived from host and urlPath
url: "https://" + path.Join([host, urlPath])
