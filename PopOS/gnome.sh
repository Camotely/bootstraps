#!/bin/bash

# Can watch settings be changed by using `dconf watch /` and manipulating via Gnome Tweak Tools GUI.

# Get the username
USER_NAME=$(who | awk 'FNR == 1 {print $1}')

# Translate username to User ID
USER_ID=$(id -u "${USER_NAME}")

# Setting Gnome background
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/pop/nick-nazzaro-space-blue.png'

# Set lock screen
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/pop/nick-nazzaro-space-blue.png'

# Add Minimize and Maximmize buttons
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Enabled extensions
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.shell enabled-extensions "['alt-tab-raise-first-window@system76.com', 'always-show-workspaces@system76.com', 'pop-shell@system76.com', 'pop-shop-details@system76.com', 'system76-power@system76.com', 'horizontal-workspaces@gnome-shell-extensions.gcampax.github.com', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'ubuntu-appindicators@ubuntu.com']"

# Disabled extensions
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.shell disabled-extensions "['ding@rastersoft.com']"

# Enable tiling
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.shell.extensions.pop-shell tile-by-default true

# Disable Alert Sounds
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.sound event-sounds false
 
