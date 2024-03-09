#!/bin/zsh
# - functions to load
# - ZSH basic options
# - ENVs to set

ZDEBUG="${ZDEBUG:-"false"}"

internet_access=true; timeout 1 curl https://ipinfo.io/ip >/dev/null 2>&1 || internet_access=false

# reminder 'sh -c "$(curl -fsLS get.chezmoi.io/lb)"'

# Script sourcing check
test -z "$PS1" \
	&& echo -e "This script \033[00;31mshould be sourced\033[0m not executed" && exit 1

source "$(dirname "$0")/00_functions.zsh"

# some history configurations
export HISTFILE=~/.zsh_history # Where it gets saved
export HISTSIZE=10000
export SAVEHIST=10000
setopt append_history # Don't overwrite, append!
setopt INC_APPEND_HISTORY # Write after each command
setopt hist_expire_dups_first # Expire duplicate entries first when trimming history.
setopt hist_fcntl_lock # use OS file locking
setopt hist_ignore_all_dups # Delete old recorded entry if new entry is a duplicate.
setopt hist_lex_words # better word splitting, but more CPU heavy
setopt hist_reduce_blanks # Remove superfluous blanks before recording entry.
setopt hist_save_no_dups # Don't write duplicate entries in the history file.
setopt share_history # share history between multiple shells
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.

# unmanaged bin dir in .local/bin
int_extend_path "$HOME/.local/bin:$PATH" "true"

# default editor
command -v code >/dev/null 2>&1 && \
	export EDITOR="code -w" || \
    export EDITOR="vi"
command -v codium >/dev/null 2>&1 && \
	export EDITOR="codium -w" || \
    export EDITOR="vi"
command -v kubectl >/dev/null 2>&1 && \
	export KUBE_EDITOR="$EDITOR"

# adding some bin paths for terraform/terragrunt
# see https://github.com/tfutils/tfenv and https://github.com/tgenv/tgenv
int_extend_path "$HOME/.tfenv/bin:$PATH" "true"
int_extend_path "$HOME/.tgenv/bin:$PATH" "true"
int_extend_path "${KREW_ROOT:-$HOME/.krew}/bin:$PATH" "true"

# setting go-stuff
mkdir -p "$HOME/.golib"
export GOPATH="$HOME/.golib"
int_extend_path "$GOPATH/bin"