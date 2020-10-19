REPO_PATH := $(shell cat "./REPO")
IMAGE_NAME := "libresignage-buildenv"
IMAGE_VERSION := "v0.1.0"

.PHONY: run
.ONESHELL:

# Build the build env Docker image.
build: Dockerfile
	@:
	docker build --tag $(IMAGE_NAME):$(IMAGE_VERSION) .

# Run the Docker container with an interactive bash shell as the entrypoint.
# The LibreSignage repo is also mounted inside the container at /LibreSignage/.
run:
	@:
	docker run \
		-it \
		--entrypoint bash \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(REPO_PATH):/LibreSignage/ \
		$(IMAGE_NAME):$(IMAGE_VERSION)
