#!/bin/sh

# Enable experimental Docker features (ie. buildx)
echo "[Info] Enabling experimental Docker features..."
export DOCKER_CLI_EXPERIMENTAL=enabled

# Setup a Docker builder and enable multiarch support.
echo "[Info] Creating a Docker builder with multiarch support..."
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx create --driver=docker-container --name=lsbuilder --use

echo "[Info] Docker builder info:"
docker buildx inspect --bootstrap

echo "[Info] Starting interactive shell..."
/bin/bash
