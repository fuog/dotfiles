#!/bin/bash
# debug with : chezmoi state delete-bucket --bucket=scriptState
OS=$(uname -s)
ARCH=$(uname -m)
if [[ "$OS" == "Darwin" && "$ARCH" == "arm64" ]]; then
    echo "This is a Darwin arm64 system"
    command -v apt-get >/dev/null 2>&1 || \
        { echo "This Linux is not supported without 'apt-get'!"; exit 1 ;}

    sudo apt-get install ansible -y
    echo foo

elif [[ "$OS" == "Linux" && "$ARCH" == "x86_64" ]]; then
    echo "This is a Linux amd64 system"

else
    echo "This is no debian/x86 or Darwin/arm64!"
    exit 1
fi