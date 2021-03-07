#!/bin/bash

# PopOS! Shell Install
apt-get install node-typescript make git -y
git clone https://github.com/pop-os/shell /tmp/shell
yes | make local-install
