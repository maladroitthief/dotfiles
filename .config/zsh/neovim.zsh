export PATH="$PATH:$HOME/.local/share/nvim/mason/bin:$HOME/.local/bin"
export EDITOR="nvim-wait"
export VISUAL="nvim-wait"

nvim() {
  if [ -n "$NVIM" ] && [ $# -eq 0 ]; then
    echo "Already inside Neovim."
    return 0
  fi

  nvim-open "$@"

  if [ -n "$TMUX" ] && [ -z "$NVIM" ]; then
    local pane
    pane=$(tmux list-panes -s -F '#{pane_id} #{pane_current_command}' | awk '$2=="nvim"{print $1; exit}')
    [ -n "$pane" ] && tmux switch-client -t "$pane"
  fi
}
