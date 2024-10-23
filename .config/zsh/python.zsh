export PATH="$PATH:$HOME/.pyenv/shims"
export PYENV_ROOT="$HOME/.pyenv"

command -v pyenv >/dev/null || export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init -)"
