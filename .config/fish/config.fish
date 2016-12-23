# install fisherman if not present
if not functions -q fisher; eval (curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher); end

# remove welcome message
set fish_greeting ""

# define aliases
alias aurau "sudo aura -Syu; sudo aura -Akua"
alias aurac "sudo aura -Oj; and sudo paccache -r; and sudo paccache -ruk0; and sudo pacman-optimize"
alias auras "sudo reflector --verbose -l 25 --sort rate --save /etc/pacman.d/mirrorlist"
alias rm='echo "This is not the command you are looking for"; false'
alias git='hub'

function prepend_command
  set -l prepend $argv[1]
  if test -z "$prepend"
    echo "prepend_command needs one argument."
    return 1
  end

  set -l cmd (commandline)
  if test -z "$cmd"
    commandline -r $history[1]
  end

  set -l old_cursor (commandline -C)
  commandline -C 0
  commandline -i "$prepend "
  commandline -C (math $old_cursor + (echo $prepend | wc -c))
end

function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

# define custom keybindings
function fish_user_key_bindings
  bind \ej history-search-forward
  bind \ek history-search-backward
  bind \el forward-char
  bind \eh backward-char
  bind \ew forward-word
  bind \eb backward-word
  # bind '!!' 'commandline -i "$history[1]"'
  bind ! bind_bang
  bind \cs 'prepend_command sudo'
end

# source environment
bass source ~/.profile
