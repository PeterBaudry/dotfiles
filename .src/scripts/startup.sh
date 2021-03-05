#!/usr/bin/env bash

wget -q --spider http://google.com

# Actions to do based on internet connection
if [ $? -eq 0 ]; then
    echo "Online"

    # Sync cloud
    sh $HOME/.src/scripts/sync_cloud.sh
else
    echo "Offline"
fi

# Load xrandr profiles
autorandr --change &

# Set touchpad options
# Natural scrolling
xinput set-prop "DLL0945:00 06CB:CDE6 Touchpad" 331 1
# Tap to click
xinput set-prop "DLL0945:00 06CB:CDE6 Touchpad" 313 1
# Disable touchpad while typing
xinput set-prop "DLL0945:00 06CB:CDE6 Touchpad" 339 1
