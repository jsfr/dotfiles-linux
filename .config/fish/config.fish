# install fisherman if not present
if not functions -q fisher; eval (curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher); end

# define custom keybindings
function fish_user_key_bindings
  bind \ej history-search-forward
  bind \ek history-search-backward
  bind \el forward-char
  bind \eh backward-char
  bind \ew forward-word
  bind \eb backward-word
end

# remove welcome message
set fish_greeting ""

# define aliases
alias aurau "sudo aura -Syu; sudo aura -Akua"
alias aurac "sudo aura -Oj; and sudo paccache -r; and sudo paccache -ruk0; and sudo pacman-optimize"
alias auras "sudo reflector --verbose -l 25 --sort rate --save /etc/pacman.d/mirrorlist"
alias rm='echo "This is not the command you are looking for"; false'

# evals
eval (hub alias -s)
eval (thefuck --alias | tr '\n' ';')

# Dirty hack to make delete work in st under fish
switch $TERM
    case 'st-*' # suckless' simple terminal
                # Enable keypad, do it once before fish_postexec ever fires
        tput smkx
        function st_smkx --on-event fish_postexec
            tput smkx
        end
        function st_rmkx --on-event fish_preexec
            tput rmkx
        end
end

# source environment
bass source ~/.profile
