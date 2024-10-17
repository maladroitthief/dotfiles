find_dir() {
    dir=$(find * -type d 2>/dev/null | fzf --tmux);
    cd $dir;
}


zle -N find_dir

bindkey "^f" find_dir
