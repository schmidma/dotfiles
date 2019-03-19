setxkbmap -layout us -variant altgr-intl -option nodeadkeys
setxkbmap -option caps:escape
xset r rate 200 30
xmodmap /home/schmidma/.Xmodmap
xrdb /home/schmidma/.Xdefaults
exec i3
