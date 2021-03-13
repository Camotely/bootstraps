#!/bin/bash

USER_NAME=$(ls /home)
USER_HOME="/home/$USER_NAME"

# Download and install Microsoft's package signing key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/

# Add VSCode repository
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

# Install VSCode
apt-get update
apt-get install -y \
	code \
	python3-pip

# Clean up
rm -f packages.microsoft.gpg

# Pip installs
python3 -m pip install pip --upgrade
python3 -m pip install setuptools --upgrade
python3 -m pip install pylint

# Install extensions
su "$USER_NAME" -c "code --install-extension ms-python.python"
su "$USER_NAME" -c "code --install-extension timonwong.shellcheck"
su "$USER_NAME" -c "code --install-extension yzhang.markdown-all-in-one"
su "$USER_NAME" -c "code --install-extension vscodevim.vim"
