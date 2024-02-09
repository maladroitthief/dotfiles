alias sudo='sudo '
alias vim='nvim'
alias vi='nvim'
alias view='nvim -R'
alias vimdiff='nvim -d'
alias fix-audio='systemctl --user restart pipewire-pulse.service'

bind -x '"\C-f": dir=$(find * -type d | fzf) && cd $dir'
bind -x '"\C-p": dir=$(find * -type d | fzf) && cd $dir && vim .'
