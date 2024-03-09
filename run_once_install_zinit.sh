#!/bin/zsh
# setting up zinit if needed
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
    echo "Install once! ZINIT not found in $ZINIT_HOME installing it"
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    source "${ZINIT_HOME}/zinit.zsh"
fi
