# set -x
export CLICOLOR=1

# NOTE: The order here matters -ian
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

# Keep zshrc clean
for config (~/.config/zsh/*.zsh) source $config
for config (~/.config/zsh/secret/*.zsh) source $config

# must be at the end
eval "$(starship init zsh)"
# set +x

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
