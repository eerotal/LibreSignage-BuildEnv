#!/bin/sh

#
# Entrypoint script for the LibreSignage build environment container.
# This sets up the environment before starting bash.
#

# Enable experimental Docker features (ie. buildx)
export DOCKER_CLI_EXPERIMENTAL=enabled

/bin/bash
