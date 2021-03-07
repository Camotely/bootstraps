#!/bin/bash

USER_NAME=$(ls /home)
USER_HOME="/home/$USER_NAME"

# Update and install
dnf update
dnf install vim git -y

# Remove folders
rm -rf "$USER_HOME"/Desktop "$USER_HOME"/Pictures "$USER_HOME"/Templates "$USER_HOME"/Videos "$USER_HOME"/Public "$USER_HOME"/Music