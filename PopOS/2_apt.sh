#!/bin/bash

progs=(
	vim
	gnome-tweaks
	gnome-shell-extensions
	timeshift
	solaar
	solaar-gnome3
	tlp
	tlp-rdw
	python3-pip
	chromium
	slack-desktop
	discord
)

for i in ${progs[@]}; do
	apt-get install -y $i
done
