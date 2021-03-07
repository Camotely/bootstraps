#!/bin/bash

USER_NAME=$(ls /home)
USER_HOME="/home/$USER_NAME"

# Programs
progs=(
	discord
)

classics=(
	slack
)

# Install
for i in ${progs[@]}; do
	snap install $i
done


for i in ${classics[@]}; do
	snap install $i --classic
done
