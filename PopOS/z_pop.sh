#!/bin/bash

USER_NAME=$(ls /home)
USER_HOME="/home/$USER_NAME"

# Extra steps
rm -rf /etc/libreoffice
rm -rf "$USER_HOME"/.mozilla

# Cleanup
apt-get autoremove -y
apt-get autoclean
