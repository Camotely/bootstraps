#!/bin/bash

# Get the kernel version
kern_ver=$(uname -r | cut -d. -f1-2)

# Only upgrade kernel if kernel is earlier than 5.11
if (( $(echo "$kern_ver >= 5.11" | bc -l) )); then
    exit
fi

# Move to /tmp
cd /tmp

# Download
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-headers-5.11.0-051100_5.11.0-051100.202102142330_all.deb
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-headers-5.11.0-051100-generic_5.11.0-051100.202102142330_amd64.deb
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-image-unsigned-5.11.0-051100-generic_5.11.0-051100.202102142330_amd64.deb
wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-modules-5.11.0-051100-generic_5.11.0-051100.202102142330_amd64.deb

# Install
dpkg -i *.deb

# Remove
rm *.deb
