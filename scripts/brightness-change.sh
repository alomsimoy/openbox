#!/bin/bash
brightness=`xbacklight -get | grep -Eo '[0-9]{1,3}' | head -n 1`

killall notify-osd
notify-send "Brillo" -t 5000 -i display -h int:value:$brightness
