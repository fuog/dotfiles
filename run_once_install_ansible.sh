#!/bin/bash
OS=$(uname -s)
ARCH=$(uname -m)
if [[ "$OS" == "Darwin" && "$ARCH" == "arm64" ]]; then
    echo "This is a Darwin arm64 system"
    command -v bat >/dev/null 2>&1 || \
        { echo "This Linux is not supported without 'apt-get'!"; exit 1 ;}

    apt-get install ansible -y


elif [[ "$OS" == "Linux" && "$ARCH" == "x86_64" ]]; then
    echo "This is a Linux amd64 system"

else
    echo "This is no debian/x86 or Darwin/arm64!"
    exit 1
fi