# remove welcome message
set fish_greeting ""

# define aliases
alias aurau "sudo aura -Syu; sudo aura -Akua"
alias aurac "sudo aura -Oj; and sudo paccache -r; and sudo paccache -ruk0; and sudo pacman-optimize"
alias auras "sudo reflector --verbose -l 25 --sort rate --save /etc/pacman.d/mirrorlist"
