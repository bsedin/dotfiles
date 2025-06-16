#!/bin/bash

export BROWSER=browser
export TERMINAL=st
export XTERM=st
export LANGUAGE=en_US:en_GB:en
export LC_TIME=en_US.UTF-8
export COLORTERM=truecolor

export QT_QPA_PLATFORMTHEME=qt5ct
unset QT_STYLE_OVERRIDE

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=/run/user/1000
export DOCKER_HOST=unix:///var/run/docker.sock

# export VDPAU_DRIVER=radeonsi

# https://github.com/robbert-vdh/yabridge#environment-configuration
export WINEFSYNC=1
export SUDO_ASKPASS=/usr/bin/ssh-askpass-fullscreen

# Nvidia vaapi https://github.com/elFarto/nvidia-vaapi-driver?tab=readme-ov-file#direct-backend
export NVD_BACKEND=direct
export LIBVA_DRIVER_NAME=nvidia
export MOZ_DISABLE_RDD_SANDBOX=1
export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/10_nvidia.json

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# TrackPoint+Middleclick scroll
# xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
# xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
# xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
# xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# Disable edge scrolling
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Edge Scrolling" 0 0 0

# Enable middle button emulation by pressing left and right buttons together
xinput set-prop "Primax Kensington Eagle Trackball" "Evdev Middle Button Emulation" 1

# xinput map-to-output "Wacom Graphire2 4x5 Pen stylus" DP-0
# xinput map-to-output "Wacom Graphire2 4x5 Pen eraser" DP-0
# xinput map-to-output "Wacom Graphire2 4x5 Pen cursor" DP-0

# exec ck-launch-session dbus-launch
xrdb -merge ~/.Xresources

exec dbus-launch --exit-with-x11 i3 > $HOME/log/i3.txt 2>&1
