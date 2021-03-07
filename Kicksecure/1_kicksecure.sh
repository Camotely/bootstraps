#!/bin/bash

# Kicksecure setup from Debian base install

# Update and upgrade
apt-get update && apt-get dist-upgrade -y

# Should be installed by default
apt-get install -y sudo adduser curl gpg gpg-agent --no-install-recommends

# Add group and user dependencies
addgroup --system console
adduser "$USER_NAME" console
adduser "$USER_NAME" sudo

# Whonix Signing Key
curl --tlsv1.2 --proto =https --max-time 180 --output ~/patrick.asc https://www.whonix.org/patrick.asc
sudo apt-key --keyring /etc/apt/trusted.gpg.d/whonix.gpg add ~/patrick.asc

# Add repo
echo "deb https://deb.whonix.org buster main contrib non-free" | tee /etc/apt/sources.list.d/whonix.list

# Update and install
apt-get update
apt-get install kicksecure-cli -y --no-install-recommends

# Overwrite apt sources with provided
if [ -f /etc/apt/sources.list.d/debian.list ]; then
    mv /etc/apt/sources.list.d/debian.list /etc/apt/sources.list
fi