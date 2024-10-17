bind -x '"\C-f": dir=$(find * -type d | fzf) && cd $dir'
bind -x '"\C-p": dir=$(find * -type d | fzf) && cd $dir && nvim .'
