setxkbmap -layout us -variant altgr-intl -option nodeadkeys
setxkbmap -option caps:escape
xset r rate 200 30
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 0.4
xmodmap /home/schmidma/.Xmodmap
xrdb /home/schmidma/.Xdefaults
exec i3
