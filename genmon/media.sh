#!/bin/fish

if test (playerctl status) = "Paused"
    set XPAN "<img>/home/alex/.config/genmon/icons/pause.png</img>"
    set text "Paused"
else
    set XPAN "<img>/home/alex/.config/genmon/icons/play.png</img>"
    set text "<span>$(playerctl metadata xesam:artist) - $(playerctl metadata xesam:title)<span>"
end

# set -a XPAN "Not implemented error  ¯\_(ツ)_/¯"
# XPAN "<span fgcolor='#eeeeee'>${INTERFACE}: $(/home/alex/.local/bin/netmon ${INTERFACE})</span> "
set -a XPAN "<txt>" 
set -a XPAN $text
set -a XPAN "</txt>"

# Genmon tooltip XML
set XTOOL "<tool>"
set -a XTOOL "Not implemented error  ¯\_(ツ)_/¯"
set -a XTOOL "</tool>"

# Echo the panel
echo -e "$XPAN"

# Echo the tooltip
echo -e "$XTOOL"