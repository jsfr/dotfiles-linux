# source conf.d directory
for file in ~/.config/fish/conf.d/*.fish
    source $file
end

# remove welcome message
set fish_greeting ""

# define aliases
alias aurau "sudo aur; sudo aura -Syu; sudo aura -Akua"
alias aurac "sudo aura -Oj; and sudo paccache -r; and sudo paccache -ruk0; and sudo pacman-optimize"
alias auras "sudo reflector --verbose -l 25 --sort rate --save /etc/pacman.d/mirrorlist"

# source /etc/profile and ~/.profile using dash
env -i HOME=$HOME dash -l -c 'export -p' | sed -e "/PWD/d; /PATH/s/'//g;/PATH/s/:/ /g;s/=/ /;s/^export/set -x/" | source

# set up fuck alias
eval (thefuck --alias | tr '\n' ';')

# reuse environment variables from ~/.zsh_environment
egrep "^export " ~/.zsh_environment | while read e
    set var (echo $e | sed -E "s/^export ([A-Z0-9_]+)=(.*)\$/\1/")
    set value (echo $e | sed -E "s/^export ([A-Z0-9_]+)=(.*)\$/\2/")
    # remove surrounding quotes if existing
    set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")
    if test $var = "PATH"
        # replace ":" by spaces. this is how PATH looks for Fish
        set value (echo $value | sed -E "s/:/ /g")
        # use eval because we need to expand the value
        eval set -xg $var $value
        continue
    end
    # evaluate variables. we can use eval because we most likely just used "$var"
    set value (eval echo $value)
    switch $value
    case '`*`';
        set NO_QUOTES (echo $value | sed -E "s/^\`(.*)\`\$/\1/")
        set -x $var (eval $NO_QUOTES)
    case '*'
        set -xg $var $value
    end
end

# start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
