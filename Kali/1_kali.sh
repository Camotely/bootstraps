#!/bin/bash

# Update and upgrade
apt update
apt upgrade -y

# Set up workstation to utilize root (insecure)
echo -e "toor\ntoor" | passwd root
