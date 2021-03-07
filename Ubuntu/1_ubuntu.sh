#!/bin/bash

USER_NAME=$(ls /home)
USER_HOME="/home/$USER_NAME"

#apt-get install --no-install-recommends -y \
apt-get install -y \
	vim \
	git \
	tlp \
	htop \
	nmap \
	curl \
	gnome-shell-extensions

# Dotfiles
git clone https://github.com/camotely/dotfiles.git "$USER_HOME"/Documents/dotfiles

# Background pic
cp "$USER_HOME"/Documents/dotfiles/backgrounds/1.jpg /usr/share/backgrounds/
