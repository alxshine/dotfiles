#!/usr/bin/env bash
# Filename: gen-uptime.sh
# Target: XFCE Generic Monitor (xfce4-genmon-plugin)
# Description: Displays readable system uptime and last boot
# Dependencies: bash>=3.2, file, gawk
# Based on work of: N.Lichtwald, see <https://github.com/niwald/>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# GNU General Public License
# More at: <http://www.gnu.org/licenses/>

# Script portability
readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Absolut path of the icon, 24x24px
readonly ICON="${DIR}/icons/wifi.png"
readonly INTERFACE="wlp5s0"

# System uptime and last boot

# Genmon panel XML
XPAN="<img>${ICON}</img>"
XPAN=""
XPAN+="<txt>" 
XPAN+="<span fgcolor='#eeeeee'>${INTERFACE}: $(/home/alex/.local/bin/netmon ${INTERFACE})</span> "
XPAN+="</txt>"

# Genmon tooltip XML
XTOOL="<tool>"
# XTOOL+="<span weight='bold'>Network config:</span>"

XTOOL+="<span fgcolor='#eeeeee'>"
for interface in $(ip link show | rg state | cut -d: -f2 | xargs);
do
  XTOOL+="<span>${interface}:\t$(/home/alex/.local/bin/netmon ${interface})</span>"
  XTOOL+="\n"
done
XTOOL+="</span>"

# XTOOL+="Not implemented error  ¯\_(ツ)_/¯"
XTOOL+="</tool>"

# Echo the panel
echo -e "${XPAN}"

# Echo the tooltip
echo -e "${XTOOL}"