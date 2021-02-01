#!/bin/sh
# screen layout
xrandr --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate right --output DP-2 --off

# rotate touch inputs
xsetwacom set "Wacom Pen and multitouch sensor Finger touch" Rotate cw
xsetwacom set "Wacom Pen and multitouch sensor Pen stylus" Rotate cw
xsetwacom set "Wacom Pen and multitouch sensor Pen eraser" Rotate cw

# disable touchpad
xinput disable "ETPS/2 Elantech Touchpad"
