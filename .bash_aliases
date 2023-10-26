alias sudo='sudo '
alias vim='nvim'
alias vi='nvim'
alias view='nvim -R'
alias vimdiff='nvim -d'

bind -x '"\C-f": dir=$(find * -type d | fzf) && cd $dir'
bind -x '"\C-p": dir=$(find * -type d | fzf) && cd $dir && vim .'
