#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

sxhkd &
dmenu-cache 10m &
sh feh ~/.fehbg &
xrdb -merge ~/.Xresources &
xset -dpms &
xset s off &
exec bspwm
