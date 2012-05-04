xmodmap ~/.Xmodmap

#xset r rate 250 50
xsetroot -solid black
#xsetroot -cursor_name left_ptr
#xbindkeys
#xscreensaver -no-splash &
#xautolock -time 5 -locker slock -nowlocker slock -detectsleep -corners 000+ -cornerdelay 3 & 
chromium &

$HOME/bin/nark.sh &
xrdb ~/.Xresources
urxvtd -f -o 
urxvtc &

conky | while read -r; do xsetroot -name "$REPLY"; done & 
#exec ck-launch-session dwm# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

dwm

