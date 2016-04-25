# Merge Xresources and start i3
xrdb -merge ~/.Xresources &
xmodmap .Xmodmap &
exec i3
