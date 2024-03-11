# Dotfiles

> WARNING: The repo you may looking for has moved to "team-dotfiles".
> <https://github.com/fuog/team-dotfiles>


This repo is for used with [chezmoi](https://www.chezmoi.io/).

## Pre-requisition

- on Linux
  - install `chezmoi` somehow (via snap with `--classic` or as [binary download](https://www.chezmoi.io/install/#__tabbed_6_1))
  - install `rbw` somehow
- on Mac
  - [install brew](https://brew.sh/) first
  - install chezmoi with `brew install chezmoi`
  - install `rbw`

Now you can start with `chezmoi init --apply fuog/dotfiles`

## Unlocking stuff

Using `rbw` to write the privat key. This tool needs to be setup for chezmoito work.

```bash
rbw config set email foo@bar
rbw config set base_url https://..
rbw login
rbw get --field id "21091ceb-721e-4bb5-8e83-5a55ec337d9c" \
  --raw | jq -r '.data.password' \
    >> "$HOME/.config/chezmoi/age_identity_key.txt"
chmod 600 "$HOME/.config/chezmoi/age_identity_key.txt"
```
