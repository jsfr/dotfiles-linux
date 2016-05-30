for file in ~/.config/fish/conf.d/*.fish
    source $file
end

function grc.wrap -a executable
  set executable $argv[1]

  if test (count $argv) -gt 1
    set arguments $argv[2..(count $argv)]
  else
    set arguments
  end

  set optionsvariable "grcplugin_"$executable
  set options $$optionsvariable

  command grc -es $executable $options $arguments
end

if type -q grc
  set -l execs cat cvs df diff dig gcc g++ ls ifconfig \
               make mount mtr netstat ping ps tail traceroute \
               wdiff

  if set -q grc_plugin_execs
    set execs $grc_plugin_execs
  end

  for executable in $execs
    if type -q $executable
      function $executable --inherit-variable executable --wraps=$executable
        grc.wrap $executable $argv
      end
    end
  end
else
  echo 'You need to install grc!'
end

alias aurau "sudo aur; sudo aura -Syu; sudo aura -Akua"
alias aurac "sudo aura -Oj; and sudo paccache -r; and sudo paccache -ruk0; and sudo pacman-optimize"
alias auras "sudo reflector --verbose -l 25 --sort rate --save /etc/pacman.d/mirrorlist"
