#!/bin/bash 

step=3 

if [[ $# -eq 1 ]]; then 
case $1 in 
"up") 
amixer set Master $step+;; 
"down") 
amixer set Master $step-;; 
"toggle") 
amixer set Master toggle;; 
*) 
echo "Invalid option";; 
esac 
fi 

muted=`amixer get Master|tail -n1|sed -r 's/.*\[(.*)\].*/\1/'` 
volume=`amixer get Master|tail -n1|sed -r 's/.*\[(.*)%\].*/\1/'` 

NID=`cat .NID` 
if [[ $NID == "" ]]; then 
NID=0 
fi

if [[ $muted == "off" ]]; then 
NID=`cat .NID` 
NID=$(notify-send -p -r $NID "Muted" -t 5000 -i notification-audio-volume-muted -h int:value:$volume) 
echo $NID > .NID 
else 
NID=`cat .NID` 
NID=$(notify-send -p -r $NID "Volume" -t 5000 -i notification-audio-volume-medium -h int:value:$volume) 
echo $NID > .NID 
fi 