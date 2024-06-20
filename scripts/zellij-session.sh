#!/bin/bash

session = {zellij list-sessions | gum filter --limit 1 --placeholder 'Choose a session' --height 50 --prompt='⚡'}
echo $session

