#!/bin/bash

# Download VMWare Workstation 15 Pro
curl -L "https://www.vmware.com/go/getworkstation-linux" -o /tmp/vmware.sh

# Install VMWare Workstation 15 Pro
bash /tmp/vmware.sh --console --eulas-agreed --required -I --set-setting vmware-workstation softwareUpdateEnabled yes

# Install needed tools
apt-get install -y build-essential

# Compile kernel modules
vmware-modconfig --console --install-all
