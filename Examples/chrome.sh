#!/bin/bash

# Download Chrome
cd /tmp
curl -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb

# Install Chrome
apt install ./chrome.deb
