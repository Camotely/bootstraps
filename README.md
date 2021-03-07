# Bootstraps
Repository of bootstrap scripts for workstations

## How they work:
The bootstrap script will run scripts out of a folder.  Due to how the script is written, if there is a script that needs to go first, second, third, etc. it needs to be prepended with a `#_`. This is the easiest way to keep a base bootstrap and easy individual install scripts.

For instance, if you need to start off with updates on an Ubuntu system, you should have something like:

```sh
1_ubuntu.sh

#!/bin/bash

apt update
apt upgrade -y
```

This is done to ensure that ordering can take place, just in case something NEEDS to come first.  

## Why not Ansible?
Likely will be transitioning to Ansible for these in the future, but currently it's easier to write a simple `bash` script and throw it in a folder to keep things going.
