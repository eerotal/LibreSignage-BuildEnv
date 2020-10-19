LibreSignage-BuildEnv - A Dockerized LibreSignage build environment
-------------------------------------------------------------------

This repository contains a Dockerfile and some scripts for building and running
a LibreSignage build environment in a Docker container. Setting up the build
environment in a Docker container is beneficial because that way you can avoid
setting up all of the necessary build system dependencies directly on you machine.
This also makes it easy to clean up the whole build environment by simply removing
the entire container.

Dependencies
++++++++++++

The only depencency is Docker. Install it by following the instructions from the
Docker website: https://docs.docker.com/get-docker/.

Usage
+++++

Building the build environment image
....................................

Simply run ``./buildenv.sh build`` to build a Docker image with the entire
LibreSignage build system. This command probably takes a while to complete but
it should produce an image called ``libresignage-buildenv`` in your local
Docker registry.

Running a build environment container
.....................................

Clone the LibreSignage GIT repository (https://github.com/eerotal/LibreSignage/)
somewhere on your machine and create a file called ``repository.conf`` in the
**LibreSignage-BuildEnv** repository directory. Write the path to the
**LibreSignage** repository into the ``repository.conf`` file. Then you can
start an interactive bash session in the container by simply running
``buildenv.sh run``. If you run ``ls -l`` you should see the contents of the
cloned LibreSignage repo because the directory is directly bind mounted into
the container. See the main LibreSignage readme for build instructions.
