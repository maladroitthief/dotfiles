find_dir() {
    local dir
    local ok

    dir=$(find * -type d 2> /dev/null | fzf --tmux)
    ok=$?

    if [[ $ok -eq 0 && -n $dir ]]; then
        cd -- "$dir"
        zle accept-line
    else
        zle redisplay
    fi
}

zle -N find_dir

bindkey "^f" find_dir
