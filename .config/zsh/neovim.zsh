export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"
export EDITOR="nvim"
# export EDITOR="nvim-wait"
# export VISUAL="nvim-wait"
#
# nvim() {
#   if [ -n "$NVIM" ]; then
#     if [ $# -eq 0 ]; then
#       echo "Already inside a Neovim terminal buffer."
#       return 0
#     fi
#     command nvim --server "$NVIM" --remote-tab "$@"
#     return
#   fi
#
#   if [ -n "$TMUX" ]; then
#     local session_name
#     session_name=$(tmux display-message -p '#S')
#
#     local safe_session
#     safe_session=$(printf '%s' "$session_name" | tr -c 'a-zA-Z0-9_' '_')
#     local socket="${XDG_RUNTIME_DIR:-/tmp}/nvim-${safe_session}.sock"
#
#     if [ -S "$socket" ] && command nvim --server "$socket" --remote-expr "1" >/dev/null 2>&1; then
#       local target_pane
#       target_pane=$(tmux show-option -qv -t "$session_name" "@nvim_pane")
#
#       if [ $# -eq 0 ]; then
#         if [ -n "$target_pane" ]; then
#           tmux select-window -t "$target_pane"
#           tmux select-pane -t "$target_pane"
#         fi
#         return 0
#       fi
#
# 			if [ $# -eq 0 ]; then
#         command nvim --server "$socket" --remote-send "<C-\><C-N><Cmd>tabnew<CR>"
#       else
#       	command nvim --server "$socket" --remote-tab "$@"
#       fi
#
#       if [ -n "$target_pane" ]; then
#         tmux select-window -t "$target_pane"
#         tmux select-pane -t "$target_pane"
#       fi
#       return
#     fi
#
#     rm -f "$socket"
#
#     tmux set-option -t "$session_name" "@nvim_pane" "$TMUX_PANE"
#
#     command nvim --listen "$socket" "$@"
#
#     tmux set-option -u -t "$session_name" "@nvim_pane"
#     return
#   fi
#
#   command nvim "$@"
# }
#
# nvim-wait() {
#   local session_name
#   session_name=$(tmux display-message -p '#S' 2>/dev/null)
#   local socket="${XDG_RUNTIME_DIR:-/tmp}/nvim-$(printf '%s' "$session_name" | tr -c 'a-zA-Z0-9_' '_').sock"
#
#   if [ -n "$TMUX" ] && [ -S "$socket" ] && command nvim --server "$socket" --remote-expr "1" >/dev/null 2>&1; then
#     command nvim --server "$socket" --remote-tab-wait "$@"
#   else
#     command nvim "$@"
#   fi
# }
