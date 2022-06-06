#!/bin/bash

export BROWSER=browser
export TERMINAL=kitty
export XTERM=kitty
export LANGUAGE=en_US:en_GB:en
export LC_TIME=ru_RU.UTF-8
export COLORTERM=truecolor

export QT_QPA_PLATFORMTHEME=qt5ct
unset QT_STYLE_OVERRIDE

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=/run/user/1000
export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock

# export VDPAU_DRIVER=radeonsi

# https://github.com/robbert-vdh/yabridge#environment-configuration
export WINEFSYNC=1
export SUDO_ASKPASS=/usr/bin/ssh-askpass-fullscreen

# TrackPoint+Middleclick scroll
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

xinput set-prop "Primax Kensington Eagle Trackball" "Evdev Middle Button Emulation" 1

# exec ck-launch-session dbus-launch
xrdb -merge ~/.Xresources

exec dbus-launch --exit-with-x11 i3 > $HOME/log/i3.txt 2>&1
