#!/usr/bin/env bash
set -euo pipefail

PROJECT=hof-io--develop
TAG=$(git rev-parse --short HEAD | tr -d "\n")

./ci/highlight.sh

hugo --baseURL https://cuetorials.com/ -d dist

docker build -t us.gcr.io/$PROJECT/cuetorials.com:manual .
docker push us.gcr.io/$PROJECT/cuetorials.com:manual

# rm -rf dist

kubectl get pods -n websites

