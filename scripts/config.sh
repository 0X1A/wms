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

#FONT="-artwiz-lime-medium-r-normal-*-10-110-75-75-m-50-iso8859-*"
FONT="-artwiz-limey-medium-r-normal-*-10-110-75-75-m-50-iso8859-*"
#FONT="-*-lemon-*-*-*-*-*-*-*-*-*-*-*-*"
white0="#93A1A1"

bar_bg="#000000"
bar_fg="#93a1a1"
notify="#F39D21"
warning="#D23D3D"
