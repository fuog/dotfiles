#!/bin/bash

# dconf.ini hash: {{ include "dot_config/bootstrap/main.yaml" | sha256sum }}

ansible-playbook "$HOME/.config/bootstrap/main.yaml"