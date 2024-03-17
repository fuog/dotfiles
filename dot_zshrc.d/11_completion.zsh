#!/bin/zsh

(update_bin_completion rbw gen-completions zsh > /dev/null 2>&1 &)
(update_bin_completion tkn completion zsh > /dev/null 2>&1 &)
(update_bin_completion k3d completion zsh > /dev/null 2>&1 &)
(update_bin_completion podman completion zsh > /dev/null 2>&1 &)
(update_bin_completion kube-bench completion zsh > /dev/null 2>&1 &)
(update_bin_completion pv-migrate completion zsh > /dev/null 2>&1 &)
(update_bin_completion chezmoi completion zsh > /dev/null 2>&1 &)
(update_bin_completion kubectl completion zsh > /dev/null 2>&1 &)
(update_bin_completion helm completion zsh > /dev/null 2>&1 &)
(update_bin_completion helmfile completion zsh > /dev/null 2>&1 &)
(update_bin_completion helm_ls completion zsh > /dev/null 2>&1 &)
(update_bin_completion rbw gen-completions zsh > /dev/null 2>&1 &)

# at the very end ..
unfunction int_extend_path
unfunction update_bin_completion
unset internet_access