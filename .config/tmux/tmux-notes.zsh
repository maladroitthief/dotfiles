#!/bin/zsh

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

cd "$(dirname "$0")"

main() {
    # NOTE: This is for prettier to work
    # source ~/.config/zsh/nvm.zsh
    notes_dir="$HOME/workspace/notes.md"

    tmux neww -n "notes" nvim $notes_dir
}

main "$@"
