# Install zplug if it is missing, otherwise just source it
if ! [[ -e ~/.zplug/zplug ]]; then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
    source ~/.zplug/zplug
    zplug update --self
else
    source ~/.zplug/zplug
fi

# Manage plugs
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/fasd", from:oh-my-zsh
zplug "plugins/git-flow-avh", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


# Setup plugs
## sindresorhus/pure
export PURE_PROMPT_SYMBOL=λ

# Then, source plugins and add commands to $PATH
zplug load

# Source environment variables and aliases
source ~/.aliases
source ~/.environment

# Needed to make GPG Agent ncurses work
export GPG_TTY=`tty`

# Function to bind keys
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
    bindkey "^[[1;3C" forward-word
    bindkey "^[[1;3D" backward-word
    bindkey "^[[3;3~" delete-word
    bindkey "^[k" history-substring-search-up
    bindkey "^[j" history-substring-search-down
    bindkey "^[l" forward-word
    bindkey "^[h" backward-word
}

# If at TTY1 start X else bind keys
([[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx) || myZkbd
