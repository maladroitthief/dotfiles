#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./setup.sh

This symlinks all dotfiles in the repo.

'
    exit
fi

cd "$(dirname "$0")"

main() {
  ln -sf $(pwd)/.zshrc ~
  ln -sf $(pwd)/.ignore ~
  ln -sf $(pwd)/.gitignore ~
  ln -sf $(pwd)/.gitconfig ~
  ln -sf $(pwd)/.tmux.conf ~
  ln -sf $(pwd)/.gdbinit ~
  ln -sf $(pwd)/.config/ghostty ~/.config
  ln -sf $(pwd)/.config/nvim ~/.config
  ln -sf $(pwd)/.config/starship.toml ~/.config
  ln -sf $(pwd)/.config/tmux ~/.config
  ln -sf $(pwd)/.config/zsh ~/.config
  ln -sf $(pwd)/.config/jj ~/.config
  ln -sf $(pwd)/.config/mpd ~/.config
  ln -sf $(pwd)/.config/beets ~/.config
  ln -sf $(pwd)/.config/rmpc ~/.config
  ln -sf $(pwd)/.config/hypr ~/.config
  ln -sf $(pwd)/.config/waybar ~/.config
  ln -sf $(pwd)/.config/rofi ~/.config
  ln -sf $(pwd)/.config/swaync ~/.config
}

main "$@"
