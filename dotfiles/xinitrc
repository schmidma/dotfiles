setxkbmap -layout us -variant altgr-intl -option nodeadkeys
setxkbmap -option caps:escape
xset r rate 200 30
systemctl --user import-environment DISPLAY
xrdb -merge ~/.Xresources
xrandr --output DP-0 --primary
unclutter &
exec i3
