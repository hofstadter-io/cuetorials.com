package main

env: string | *"dev" @tag(env)
host: "\(env).domain.com"
