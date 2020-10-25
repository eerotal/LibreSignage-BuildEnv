#!/bin/sh

#
# Entrypoint script for the LibreSignage build environment container.
# This sets up the environment before starting bash.
#

set -e

# Switch to the host user. This is done manually here because otherwise
# the host groups don't work in the container. The --user flag passed
# to 'docker run' won't work correctly.aa
USERNAME=$(getent passwd $HOST_UID | cut -d: -f1)
echo "[Info] Switching to user '$USERNAME'..."
su --session-command "/buildenv-entrypoint-2.sh" - $USERNAME
