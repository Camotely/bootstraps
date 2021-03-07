#!/bin/bash

# Install script for autorecon

# Update
apt update

# Install dependencies
apt install -y python3 python3-pip python3-venv seclists curl enum4linux gobuster nbtscan nikto nmap onesixtyone oscanner smbclient smbmap smtp-user-enum snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf

# Install `pipx`
python3 -m pip install pipx
python3 -m pipx ensurepath

# Install AutoRecon
pipx install git+https://github.com/Tib3rius/AutoRecon.git
