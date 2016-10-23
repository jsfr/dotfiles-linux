# Merge Xresources and start i3
xrdb -merge ~/.Xresources &
xmodmap .Xmodmap &
xrandr --dpi 192
exec i3
