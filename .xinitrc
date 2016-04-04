# Perform tasks
trash-empty 7 & # Remove items in trash older than 7 days

# Merge Xresources and start i3
xrdb -merge ~/.Xresources &
exec i3
