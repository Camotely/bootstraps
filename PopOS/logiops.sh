#!/bin/bash

# Clone the repo
git clone https://github.com/PixlOne/logiops /tmp/logiops

# Install dependencies
apt-get update
apt-get install -y cmake libevdev-dev libudev-dev libconfig++-dev

# Installation
mkdir /tmp/logiops/build
cd /tmp/logiops/build
cmake ..
make
make install

# Enable the daemon
systemctl enable logid

# Remove dependencies
apt-get autoremove -y cmake libevdev-dev libudev-dev libconfig++-dev
