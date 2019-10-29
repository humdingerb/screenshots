#!/bin/sh

# Screenshoot with 3s delay
# 1st parameter: the app to shoot
# 2nd parameter: the file name of the screenshot

if [ $# -eq 0 ] ; then
		echo "Usage: shoot AppToLaunch FileToSave"
		echo
		echo "Launches APP and saves after 3s delay as FILENAME_{lang}.png"
        exit
fi

LANG=$(locale -l | cut -d _ -f 1)
APP=$1
FILE=$2
DIR="./"

$APP &
waitfor $APP
#hey $APP  set Frame of Window 0 to "BRect(1216.0, 175.0, 1690.0, 474.0)"
sleep 1
hey $APP 'sswd'
screenshot -s -w -b --delay 1 ${DIR}/${FILE}_${LANG}.png
echo "Saved ${DIR}/${FILE}_${LANG}.png"
hey $APP quit
Locale