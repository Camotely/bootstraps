#!/bin/bash

# WORK IN PROGRESS

# Set default UFW rules
ufw default deny incoming
ufw default allow outgoing

# Enable UFW
ufw enable

# Disable IPv6
cat <<EOF >> /etc/sysctl.conf
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF
