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
# zplug "plugins/git-flow-avh", from:oh-my-zsh
zplug "petervanderdoes/git-flow-completion", of:"git-flow-completion.zsh"
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "sorin-ionescu/prezto", of:"modules/completion/init.zsh"

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

## zsh-users/zsh-history-substring-search
HISTFILE="$HOME/.zhistory"
HISTSIZE=10000000
SAVEHIST=10000000

## oh-my-zsh
DISABLE_AUTO_UPDATE=true

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

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
