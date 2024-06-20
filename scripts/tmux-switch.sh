#!/bin/bash

# session=$(fd --exclude={.git,.cache,.local,.oh-my-zsh,.npm,.cargo,.rustup,go,walls,Downloads} -H -d 2 -t d | gum filter --limit 1 --placeholder 'Create New Session' --prompt='⚡')
session=$( sesh list -iz | gum filter --limit 1 --placeholder 'Create New Session' --prompt='⚡')
sess=$(echo $session | awk '{print $2}')
if [ -z "$sess" ]; then
    exit 0
else
    sesh connect $sess
    # echo $sess
fi
