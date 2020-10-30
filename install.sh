#!/bin/sh

#
# Install dependencies for running the containerized LibreSignage
# build environment.
#

# Install some dependencies for Docker and multiarch emulation.
sudo apt update
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    qemu \
    binfmt-support \
    qemu-user-static

if [ -z "$(which docker)" ]; then
    # Add the Docker repository and install Docker.
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io
else
    echo "[Info] Docker already installed, skipping..."
fi
