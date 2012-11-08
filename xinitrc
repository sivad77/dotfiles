xmodmap ~/.Xmodmap

xsetroot -solid black
google-chrome --remote-debugging-port=9222 &
pidgin &

$HOME/bin/nark &
xrdb ~/.Xresources

xbindkeys &

conky | while read -r; do xsetroot -name "$REPLY"; done & 
#exec ck-launch-session dwm# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

dwm

