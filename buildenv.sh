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
		--entrypoint /buildenv-entrypoint-1.sh \
		-e HOST_UID=$(id -u) \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-v /etc/shadow:/etc/shadow:ro \
		-v /home/$(id -un):/home/$(id -un) \
		$IMAGE_NAME:$IMAGE_VERSION
fi
