#!/usr/bin/env bash

config_dir="$HOME/.config/tmux"
selected=`cat $config_dir/.tmux-cht-languages $config_dir/.tmux-cht-command | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" $config_dir/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl -s cht.sh/$selected/$query | less -r"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less -r"
fi
