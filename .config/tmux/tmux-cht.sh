#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

cd "$(dirname "$0")"

main() {
    config_dir="$HOME/.config/tmux"
    selected=`curl -s https://cht.sh/internal::list | fzf`

    if [[ -z $selected ]]; then
        exit 0
    fi

    tmux neww bash -c "nvim -mRc \":terminal curl -s cht.sh/$selected\" -"
}

main "$@"
