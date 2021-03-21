#!/bin/bash

USER_NAME=$(ls /home)
USER_HOME="/home/$USER_NAME"

# Update and upgrade
apt-get update
apt-get upgrade -y --allow-downgrades
apt-get dist-upgrade -y

# Remove folders
rmdir "$USER_HOME"/Desktop "$USER_HOME"/Pictures "$USER_HOME"/Templates "$USER_HOME"/Videos "$USER_HOME"/Public "$USER_HOME"/Music

# Set Power Settings
system76-power profile battery

# Wake from sleep fix
kernelstub -a rcutree.rcu_idle_gp_delay=1
kernelstub -a mem_sleep_default=deep

# Firmware Updates
fwupdmgr get-updates -y
fwupdmgr update -y
