export CLICOLOR=1

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Keep zshrc clean
for config (~/.config/zsh/*.zsh) source $config

# must be at the end
eval "$(starship init zsh)"

