#!/bin/bash

# Set screen brightness
gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.freedesktop.DBus.Properties.Set org.gnome.SettingsDaemon.Power.Screen Brightness "<int32 20>"


wget -q --spider http://google.com

# Actions to do based on internet connection
if [ $? -eq 0 ]; then
    echo "Online"

    # Sync cloud
    sh $HOME/.src/scripts/sync_cloud.sh
else
    echo "Offline"
fi
