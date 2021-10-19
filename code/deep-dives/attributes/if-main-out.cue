import "path"

env:     string
host:    string
urlPath: "/path/to/asset"
url:     "https://" + path.Join([host, urlPath])
