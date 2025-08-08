#!/usr/bin/env bash
set -euo pipefail
DOCKER_USER="vaibhavgumalwad"
GIT_COMMIT=$(git rev-parse --short HEAD)
IMAGE="vaibhavgumalwad/myapp:$GIT_COMMIT"
docker build -t $IMAGE .
docker push $IMAGE
