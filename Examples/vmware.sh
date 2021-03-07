#!/bin/bash

# Download VMWare Workstation 15 Pro
cd /tmp
curl -L "https://www.vmware.com/go/getworkstation-linux" -o vmware.sh

# Install VMWare Workstation 15 Pro
bash vmware.sh --console --eulas-agreed --required -I --set-setting vmware-workstation serialNumber 'FC19K-6JX81-084TP-A7ZE9-Y6KV0' --set-setting vmware-workstation softwareUpdateEnabled yes

# Compile kernel modules
vmware-modconfig --console --install-all

# Sign the modules
/usr/src/linux-headers-"$(uname -r)"/scripts/sign-file sha256 /var/lib/shim-signed/mok/MOK.priv /var/lib/shim-signed/mok/MOK.der "$(modinfo -n vmmon)"
/usr/src/linux-headers-"$(uname -r)"/scripts/sign-file sha256 /var/lib/shim-signed/mok/MOK.priv /var/lib/shim-signed/mok/MOK.der "$(modinfo -n vmnet)"

# Disable the extra services
sed -i '/# VMWARE_INIT_INFO/a exit 0' /etc/init.d/vmware-workstation-server
sed -i -e "/vmware_exec 'VMware Authentication Daemon' vmware_start_authdlauncher/s/^/#/" /etc/init.d/vmware

