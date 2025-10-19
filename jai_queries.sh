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
  jai_path=".config/nvim/after/queries/jai/"
  mkdir -p jai_path
	cp ~/workspace/maladroitthief/tree-sitter-jai/queries/* ./$jai_path
}

main "$@"
