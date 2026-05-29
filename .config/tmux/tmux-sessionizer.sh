#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	selected=$1
else
	selected=$(find ~/workspace -mindepth 1 -maxdepth 2 -type d | fzf --tmux 80%)
fi

if [[ -z $selected ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	tmux new-session -s $selected_name -c $selected
	tmux rename-window -t $selected_name:1 'nvim'
	tmux new-window -t $selected_name -c $selected -n 'jj'
	tmux split-window -t $selected_name:2 -c $selected -h
	tmux send-keys -t $selected_name:2.1 'jj st' Enter
	tmux send-keys -t $selected_name:2.2 'wjj' Enter
	tmux select-pane -t $selected_name:2.1
	exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
	tmux new-session -ds $selected_name -c $selected
	tmux rename-window -t $selected_name:1 'nvim'
	tmux new-window -t $selected_name -c $selected -n 'jj'
	tmux split-window -t $selected_name:2 -c $selected -h
	tmux send-keys -t $selected_name:2.1 'jj st' Enter
	tmux send-keys -t $selected_name:2.2 'wjj' Enter
	tmux select-pane -t $selected_name:2.1
	tmux switch-client -t $selected_name:1
	exit 0
fi

tmux switch-client -t $selected_name
