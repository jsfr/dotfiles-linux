# If not running interactively, don't do anything
[ -z "$PS1" ] && return

. /etc/profile

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    screen-256color | xterm-color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
if [ -f ~/.aliases ]; then
   . ~/.aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Set the PS1
function truncate_pwd
{
    newPWD="${PWD/#$HOME/~}"
    local pwdmaxlen=$((${COLUMNS:-80}/3))
    [ ${#newPWD} -gt $pwdmaxlen ] && newPWD="...${newPWD:3-$pwdmaxlen}"
}
PROMPT_COMMAND=truncate_pwd
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]${newPWD}\[\033[00m\]\$ '

# Add colours to manpages
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Export variables
export BROWSER=chromium
export EDITOR=vim
export PATH=$PATH:$HOME/bin

# sh opt's
shopt -s cdspell # Correct spelling of directories
shopt -s nocaseglob # Case-insensitive completion
shopt -s histappend # append to the history file, don't overwrite it
shopt -s checkwinsize # check the window size after each command and,
                      # if necessary, update the values of LINES and COLUMNS.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
