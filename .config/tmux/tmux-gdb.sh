#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

main() {
  local id1="$(tmux split-pane -hPF "#D" "tail -f /dev/null")"
  tmux last-pane
  local tty1="$(tmux display-message -p -t "$id1" '#{pane_tty}')"

  tmux swap-pane -U

  local id2="$(tmux split-pane -PF "#D" "tail -f /dev/null")"
  tmux last-pane
  local tty2="$(tmux display-message -p -t "$id2" '#{pane_tty}')"

  tmux swap-pane -D

  gdb -ex "dashboard variables -output $tty2" -ex "dashboard source -output $tty1" "$@"
  tmux kill-pane -t "$id"
}

main "$@"
