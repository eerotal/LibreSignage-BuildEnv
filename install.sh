#!/bin/sh

#
# Install dependencies for running the containerized LibreSignage
# build environment.
#

sudo apt update && sudo apt install qemu binfmt-support qemu-user-static
