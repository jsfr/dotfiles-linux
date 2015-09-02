source ~/.aliases
source ~/.environment

# Needed to make GPG Agent ncurses work
export GPG_TTY=`tty`

myZkbd() {
    autoload zkbd
    source ~/.zkbd/$TERM-:0 # may be different - check where zkbd saved the configuration:
    [[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
    [[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
    [[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
    [[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
    [[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
    [[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
    [[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
}

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[3;3~" delete-word
bindkey "^[k" history-substring-search-up
bindkey "^[j" history-substring-search-down
bindkey "^[l" forward-word
bindkey "^[h" backward-word

. /usr/lib/z.sh

([[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx) || myZkbd
