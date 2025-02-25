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
  curl -O "https://raw.githubusercontent.com/constantitus/tree-sitter-jai/refs/heads/master/queries/context.scm" --output-dir "$jai_path"
  curl -O "https://raw.githubusercontent.com/constantitus/tree-sitter-jai/refs/heads/master/queries/highlights.scm" --output-dir "$jai_path"
  curl -O "https://raw.githubusercontent.com/constantitus/tree-sitter-jai/refs/heads/master/queries/indents.scm" --output-dir "$jai_path"
}

main "$@"
