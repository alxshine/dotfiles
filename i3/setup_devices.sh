#!/bin/bash

# keyboard
setxkbmap -option grp:alt_space_toggle us,de -variant dvorak,

# gaomon tablet
xsetwacom --set "GAOMON Gaomon Tablet Pen stylus" MapToOutput 2560x1440+1920+0
xsetwacom --set "GAOMON Gaomon Tablet Pen stylus" Rotate half

