#!/bin/sh

#
# Entrypoint script for the LibreSignage build environment container.
# This sets up the environment before starting bash.
#

set -e

# Enable experimental Docker features (ie. buildx)
echo "[Info] Enabling experimental Docker features..."
export DOCKER_CLI_EXPERIMENTAL=enabled

# Setup a Docker builder and enable multiarch support.
echo "\n[Info] Creating a Docker builder with multiarch support..."
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx create --driver=docker-container --name=lsbuilder --use

echo "\n[Info] Docker builder info:"
docker buildx inspect --bootstrap

echo "\n[Info] Starting bash..."

/bin/bash
