#!/bin/sh

export BROWSER=browser
export XTERM=kitty
export LANGUAGE=en_US:en_GB:en
export LC_TIME=ru_RU.UTF-8

export QT_QPA_PLATFORMTHEME=qt5ct
unset QT_STYLE_OVERRIDE

# TrackPoint+Middleclick scroll
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# exec ck-launch-session dbus-launch
xrdb -merge ~/.Xresources
exec notion > $HOME/.notion/log.txt 2>&1
