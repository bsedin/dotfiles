#!/bin/sh

export BROWSER=browser
export TERMINAL=st
export XTERM=st
export LANGUAGE=en_US:en_GB:en
export LC_TIME=ru_RU.UTF-8

export QT_QPA_PLATFORMTHEME=qt5ct
unset QT_STYLE_OVERRIDE

export VDPAU_DRIVER=radeonsi

export $(dbus-launch)

# TrackPoint+Middleclick scroll
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# xinput set-prop "Primax Kensington Eagle Trackball" "Evdev Middle Button Emulation" 1

# exec ck-launch-session dbus-launch
xrdb -merge ~/.Xresources
exec i3 > $HOME/log/i3.txt 2>&1
