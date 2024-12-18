#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./debian-setup.sh

This installs any debian dependencies.

'
    exit
fi

cd "$(dirname "$0")"

main() {
    sudo apt install luarocks fd-find
    npm install -g tree-sitter-cli
}

main "$@"
