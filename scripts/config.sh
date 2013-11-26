#!/bin/bash

background="#000000"
foreground="#268BD2"
highlight="#93A1A1"

#XPOS=$(xdotool getmouselocation | awk -F " " '{print $1}' | cut -d ":" -f 2)
YPOS="20"
HEIGHT="20"
XOFFSET=554
if [[ -z `xrandr | grep " connected" | grep 'DVI-1'` ]]; then
	XOFFSET="0"
fi

FONT="-*-terminus-*-r-normal-*-*-80-*-*-*-*-iso8859-*"

white0="#93A1A1"
bar_bg="#586e75"
bar_fg="#93a1a1"
notify="#F39D21"
warning="#D23D3D"
