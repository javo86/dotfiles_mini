#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Set wallpaper bg
if [[ -x /usr/bin/feh && -f "${HOME}/.fehbg" ]]; then
	eval $(cat "${HOME}/.fehbg") 
fi

#Permite restart x con ctr+at+backspace
setxkbmap -option terminate:ctrl_alt_bksp


# Iniciar mpd, con configuraciones en ~/.mpd/mpd.conf
if [[ -x /usr/bin/mpd && -f "${HOME}/.mpd/mpd.conf" ]]; then
	mpd "${HOME}/.mpd/mpd.conf"
fi

# merge Xresources
if [[ -f "${HOME}/.Xresources" ]]; then
	xrdb -merge "${HOME}/.Xresources"
fi

# Iniciar urxvt daemon
if [[ -x /usr/bin/urxvtd ]]; then
	urxvtd -q -o -f 
fi

#Source xmodmap
if [[ -f "${HOME}/.Xmodmap" ]]; then
	(sleep 5s && xmodmap "${HOME}/.Xmodmap") &
fi

(sleep 2s && tint2) &
(sleep 2s && conky) &

exec openbox-session
