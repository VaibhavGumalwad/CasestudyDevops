#!/usr/bin/env bash
set -euo pipefail
GIT_COMMIT=$(git rev-parse --short HEAD)
IMAGE="vaibhavgumalwad/myapp:$GIT_COMMIT"
docker build -t $IMAGE .
docker push $IMAGE
