#!/usr/bin/env bash
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

PROJECT=hof-io--develop
TAG=$(git rev-parse --short HEAD | tr -d "\n")

docker build -t us.gcr.io/$PROJECT/cuetorials.com:$TAG .
docker push us.gcr.io/$PROJECT/cuetorials.com:$TAG
