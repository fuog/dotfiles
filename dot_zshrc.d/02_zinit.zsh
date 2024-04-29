#!/bin/zsh

# Added by p10k for quick launch of shell
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# has to be early
autoload -Uz compinit
compinit

# load ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh" || echo "Error ZINIT not found! at $ZINIT_HOME"

# Do load the 'ZI' cmd if file does exist
test -f "${ZINIT_HOME}/bin/zi.zsh" && \
    source "${ZINIT_HOME}/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

# Enable colors and change prompt:
autoload -U colors && colors

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

# Theme for zsh, example font to use is "hack nerd font" see https://www.nerdfonts.com
zi ice depth"1" && \
  zi light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
test -f "$HOME/.p10k.zsh" && source "$HOME/.p10k.zsh"

# never load the ssh-agent if we are on a remote connection
# maybe drop ?
# test -z "$SSH_CLIENT" && (
#   zi ice depth"1" pick"ssh-agent.zsh" && \
#     zi light fuog/zsh-ssh-agent )

# syntax-highlighting
zi ice depth"1" && \
  zi light zsh-users/zsh-syntax-highlighting

# check first if grc does exist
command -v grc >/dev/null 2>&1 && \
  zi ice depth"1" pick"grc.zsh" atload"command -v kubectl >/dev/null 2>&1 && unset -f kubectl >/dev/null 2>&1" && \
    zi light garabik/grc

# Load autocompletion and nice fzf key-bindings
zi ice depth"1" pick"/dev/null" as"completions" multisrc"shell/{key-bindings,completion}.zsh" && \
  zi light junegunn/fzf && \
    export FZF_CTRL_R_OPTS="--extended --exact"


zi ice depth"1" && \
  zi light zsh-users/zsh-autosuggestions

# Adding the Substing-history lookup
zi ice depth"1" pick"zsh-history-substring-search.zsh" && \
  zi light zsh-users/zsh-history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# zsh-expand
zi ice depth"1" pick"zsh-expand.plugin.zsh" && \
  zi light MenkeTechnologies/zsh-expand

# Conditional kubectl plugins: add kubectx and kubens, makes autocompletion for kubectl and some fixes to make the plugin work without oh-my-zsh
# if command -v kubectl >/dev/null 2>&1 ; then
#   source <(kubectl completion zsh)
#   zi ice depth"1" pick"kubectx.plugin.zsh" && \
#     zi light fuog/kubectx-zshplugin # made my own fork because the rpo owner wants to stay on SSH pull at submodules
#  # TODO: there is a bug if the kubectl is PATH-added after this line (eg. DevOps-Tools) has to be fixed in the future, workaround: have a kubectl already in path here by installing it with OS
#  zi ice depth"1" pick"kube-aliases.plugin.zsh" at"fix_plugin" atload"export KALIAS='$ZI[PLUGINS_DIR]/Dbz---kube-aliases'; export KRESOURCES='$ZI[PLUGINS_DIR]/Dbz---kube-aliases/docs/resources'" && \
#    zi light Dbz/kube-aliases && \
#      complete -F __start_kubectl k >/dev/null 2>&1
# fi

## adding some completion details from ohmyzsh
zi snippet OMZ::lib/completion.zsh
zi ice depth"1" as"completions" && \
  zi light zchee/zsh-completions

# Adding the OMZ feature "clipboard/clippaste"
zi snippet OMZ::lib/clipboard.zsh

# Skip forward/back a word with CTRL-arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# adding backward-tab on menu completion
bindkey "^[[Z" reverse-menu-complete
