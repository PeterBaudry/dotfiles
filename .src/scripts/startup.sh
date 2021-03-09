#!/usr/bin/env bash

# Load required programs and settings for the display manager

# Load xrandr profiles
autorandr --change &

# Set touchpad options
# Natural scrolling
xinput set-prop "DLL0945:00 06CB:CDE6 Touchpad" 331 1
# Tap to click
xinput set-prop "DLL0945:00 06CB:CDE6 Touchpad" 313 1
# Disable touchpad while typing
xinput set-prop "DLL0945:00 06CB:CDE6 Touchpad" 339 1

# Enable numlock
#/usr/bin/numlockx on