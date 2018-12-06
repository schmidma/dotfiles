#setxkbmap -layout de -variant mac
setxkbmap -layout us -variant altgr-intl -option nodeadkeys
setxkbmap -option caps:escape
xmodmap -e 'clear lock'
xset r rate 200 30
xmodmap /home/schmidma/.Xmodmap
exec i3
