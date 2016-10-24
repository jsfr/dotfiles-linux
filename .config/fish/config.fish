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

bass source ~/.profile
