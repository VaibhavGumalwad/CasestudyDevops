#!/usr/bin/env bash
set -euo pipefail
GIT_COMMIT=$(git rev-parse --short HEAD)
IMAGE="yourdockerhubusername/myapp:$GIT_COMMIT"
docker build -t $IMAGE .
docker push $IMAGE
