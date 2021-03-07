#!/bin/bash

progs=(
    libreoffice
    geary
    gucharmap
    simple-scan
    gedit
    gnome-user-docs
    libpinyin13
    gnome-remote-desktop
    gnome-weather
    gnome-calendar
    gnome-contacts
    gnome-font-viewer
    seahorse
    apport

)	

for i in ${progs[@]}; do
    apt-get purge --autoremove -y $i*
done
