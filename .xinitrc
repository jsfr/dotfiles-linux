# Environment
# source ~/.environment

# Let's go!
xrdb -merge ~/.Xresources &
setxkbmap -layout "us,dk" -variant "danish," "caps:none,compose:rctrl"
exec i3