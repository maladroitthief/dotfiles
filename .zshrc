# Keep zshrc clean
for config (~/.config/zsh/*.zsh) source $config

# must be at the end
eval "$(starship init zsh)"
