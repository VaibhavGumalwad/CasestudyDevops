#!/usr/bin/env bash
set -euo pipefail
echo "[INFO] Cleaning up Docker resources..."
docker image prune -f
docker container prune -f
docker network prune -f
echo "[INFO] Cleanup complete."
