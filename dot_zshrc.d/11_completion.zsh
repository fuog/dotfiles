#!/bin/zsh

update_bin_completion rbw gen-completions zsh
update_bin_completion tkn completion zsh
update_bin_completion k3d completion zsh
update_bin_completion podman completion zsh
update_bin_completion kube-bench completion zsh
update_bin_completion pv-migrate completion zsh
update_bin_completion chezmoi completion zsh
update_bin_completion kubectl completion zsh
update_bin_completion helm completion zsh
update_bin_completion helmfile completion zsh
update_bin_completion helm_ls completion zsh
update_bin_completion rbw gen-completions zsh

# at the very end ..
unfunction int_extend_path
unfunction update_bin_completion
unset internet_access