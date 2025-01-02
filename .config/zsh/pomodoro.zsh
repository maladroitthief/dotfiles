declare -A pomo_options
pomo_options["work"]="25"
pomo_options["rest"]="5"

function pomo() {
    if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then

    val=$1
    echo $val 🐓

    timer ${pomo_options["$val"]}m

    notify-send -u critical -t 0 -a pomo "$val done"
    fi
}

alias work="pomo 'work'"
alias rest="pomo 'rest'"
