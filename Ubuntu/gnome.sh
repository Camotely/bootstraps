#!/bin/bash

# Can watch settings be changed by using `dconf watch /` and manipulating via Gnome Tweak Tools GUI.

# Get the username
USER_NAME=$(who | awk 'FNR == 1 {print $1}')

# Translate username to User ID
USER_ID=$(id -u "${USER_NAME}")

# Change to dark theme
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'

# Setting Gnome background
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/1.jpg'

# Set lock screen
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/1.jpg'

sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.screensaver primary-color '#000000'

sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.screensaver secondary-color '#000000'

# Add Minimize and Maximmize buttons
#sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Change the dock
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock autohide false

sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false

sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

# Enabled extensions
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.shell enabled-extensions "['ubuntu-appindicators@ubuntu.com', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'horizontal-workspaces@gnome-shell-extensions.gcampax.github.com']"

# Gnome Terminal color theme
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors false

sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color 'rgb(211,215,207)'

sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color 'rgb(46,52,54)'


# Disable Alert Sounds
sudo -u "${USER_NAME}" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${USER_ID}/bus" gsettings set org.gnome.desktop.sound event-sounds false
 
