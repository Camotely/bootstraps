#!/bin/bash

USER_NAME=$(ls /home)
USER_HOME="/home/$USER_NAME"
dotfiles_dir="$USER_HOME/Documents/dotfiles"

# Clone the repository
su "$USER_NAME" -c "git clone https://github.com/Camotely/dotfiles.git $dotfiles_dir"

# Link Logitech config
ln -s $dotfiles_dir/logid.cfg /etc/logid.cfg

# Link VSCode dotfiles
code_dir="$USER_HOME/.config/Code/User"
su "$USER_NAME" -c "ln -s $dotfiles_dir/VSCode/settings.json $code_dir/settings.json"
su "$USER_NAME" -c "ln -s $dotfiles_dir/VSCode/keybindings.json $code_dir/keybindings.json"
