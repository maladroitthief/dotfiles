# set -x
export CLICOLOR=1

# NOTE: The order here matters -ian
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

# Keep zshrc clean
for config (~/.config/zsh/*.zsh) source $config
for config (~/.config/zsh/work/*.zsh) source $config

# must be at the end
eval "$(starship init zsh)"
# set +x
