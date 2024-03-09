#!/bin/zsh

# https://bytexd.com/how-to-flush-dns-cache-in-ubuntu/
alias flush-dns="sudo killall -USR2 systemd-resolved"

# for resetting some audio stuff
command -v alsa >/dev/null 2>&1 && alias audio-reload="sudo alsa force-reload"

# simple aliases
# use '' for vars to be resolved at runtime
alias reload-shell='exec ${SHELL}'

# Disable globbing on the remote path. because scp is broken
# with zsh globbing-features
alias scp='noglob scp_wrap'
function scp_wrap {
  local -a args
  local i
  for i in "$@"; do case $i in
    (*:*) args+=($i) ;;
    (*) args+=(${~i}) ;;
  esac; done
  command scp "${(@)args}"
}

# replace the normal cat
command -v bat >/dev/null 2>&1 && \
    alias cat=bat
command -v batcat >/dev/null 2>&1 && \
    alias cat=batcat

# Pipe to clipboard (apt install xclip)
command -v xclip >/dev/null 2>&1 && \
    alias xclip="xclip -selection c"

# Tarra-stuff
command -v terraform >/dev/null 2>&1 && \
    alias tf="terraform"
command -v terragrunt >/dev/null 2>&1 && \
    alias tg="terragrunt"

# adding kubeseal short for privat purpose
command -v kubeseal >/dev/null 2>&1 && \
    command -v kubectl >/dev/null 2>&1 && \
        kubectl config get-clusters | grep "Privat-K3s-cluster" >/dev/null 2>&1 && \
            alias kubeseal-priv="kubeseal --controller-name=sealed-secrets --controller-namespace=system-sealed-secrets --format yaml"

# list manually installed packages
command -v xclip >/dev/null 2>&1 && \
  alias apt-installed-pkg="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"
