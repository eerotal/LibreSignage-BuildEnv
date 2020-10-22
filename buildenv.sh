#!/bin/sh

IMAGE_NAME="libresignage-buildenv"
IMAGE_VERSION="v0.1.0"
REPO_PATH=$(cat "repository.conf")

if [ "$1" = "build" ]; then
	docker build --tag $IMAGE_NAME:$IMAGE_VERSION docker/
elif [ "$1" = "run" ]; then
	docker run \
		-it \
		--rm \
		--entrypoint /buildenv-entrypoint.sh \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $REPO_PATH:/LibreSignage/ \
		$IMAGE_NAME:$IMAGE_VERSION
fi
