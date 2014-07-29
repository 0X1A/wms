# Notify

**Note:** All scripts are set to save in [XDG basedir spec](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html) directories.

Scripts prepended with `notify-` in their name are configured through the file `notify-config`. These scripts are used to notify the user about specific events. Those of which are currently: screenshots, low battery levels, volume and disk events.
##notify-vol
`notify-vol` is used to manage the system volume.
```
$ notify-vol -h

usage: notify-vol [OPTION] [ARGUMENT]

options:
	-i, --increase	increase volume by `argument'
	-d, --decrease	decrease volume by `argument'
	-t, --toggle	toggle mute on and off
	-h, --help	display this
```
##notify-scrot
`notify-scrot` takes a screenshot using `scrot` and saves them to `$HOME/Pictures` using a timestamp set by `date +%F-%H:%M:%S` (ex: 2014-04-28-18:38:13.png)

##notify-battery
`notify-battery` checks the battery level and notifies the user when levels are below 10, 15, 20, and 25%.
```
$ notify-battery

usage: notify-bettery [TIME INTERVAL]
time interval:
	See `sleep --help` for available interval options
```

# Dmenu
Scripts prepended with `dmenu-` in their name are configured through the file `dmenu-config`
## dmenu-cache & dmenu-fm
`dmenu-cache` creates a list of all files in the users home directory in a set interval that can then be opened using `dmenu-fm`
```
$ dmenu-cache -h

usage: dmenu-cache [TIME INTERVAL]

time interval:
	See `sleep --help` for available interval options
```
## dmenu-fm
`dmenu-fm` pipes the list of files created by dmenu-cache to `dmenu2` and finally to `xdg-open`.

# Scripts

These scripts help to complete wms.

## lock
This script locks the screen using a blurred screenshot taken using `scrot` and
`i3lock`
```
$ lock -h

usage: lock [BLUR]

blur:
	1-8	Set blur sigma
```


## shifter
`shifter` runs `redshift` during a certain time of day.

## set-background
`set-background` sets the background using `feh`
```
$ set-background -h

usage: set-background [FILE] [OPTION]

options:
	scale	Set background to scale
	center	Set background to center
	tile	Set background to tile
	max	Set background to max
```
