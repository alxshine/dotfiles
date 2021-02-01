#!/bin/sh
# screen layout
xrandr --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-2 --off

# unrotate touch input
xsetwacom set "Wacom Pen and multitouch sensor Finger touch" Rotate none
xsetwacom set "Wacom Pen and multitouch sensor Pen stylus" Rotate none
xsetwacom set "Wacom Pen and multitouch sensor Pen eraser" Rotate none

# enable touchpad
xinput enable "ETPS/2 Elantech Touchpad"
