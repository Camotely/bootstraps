#!/bin/bash
#
# Author: DirWalk
# Date: June 8, 2020
#
# This script is intended to be a basic bootstrap script that
# will run setup and install scripts within a local folder. 

# Checking for root
if ! [ "$(id -u)" = 0 ]; then
    echo "[-] This script must be run as sudo or root, try again..."
    exit 1
fi

# Text Colors
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_YELLOW="\e[93m"
LIGHT_CYAN="\e[96m"
END="\e[0m"

# Color variables
WARNING=$(echo -e "$LIGHT_YELLOW!$END")
SUCCESS=$(echo -e "$LIGHT_GREEN+$END")
FAIL=$(echo -e "$LIGHT_RED-$END")
QUESTION=$(echo -e "$LIGHT_YELLOW?$END")

# Logfile
LOGFILE="/tmp/bootstrap.log"

# Username and user directory
USER_NAME=$(ls /home)
USER_HOME="/home/$USER_NAME"

# If logfile exists, remove it
if [ -f $LOGFILE ]; then
    rm -f $LOGFILE && touch $LOGFILE
fi

# Select which bootstrap
while true; do
    LIST=$(shopt -s nullglob dotglob; ls -d */ | grep -v git | grep -v Examples | sed 's/.$//')
    LIST_ARRAY=("$LIST")
    clear
    echo 'Current bootstrap directories:'
    echo '=============================='
    printf '%s\n' "${LIST_ARRAY[@]}"
    echo ""
    read -rp "Please make your selection: " SELECT
    if [[ ! -d "$SELECT" ]]; then
        read -rp "[$WARNING] Please select an existing boostrap directory. " 
    else
	    break
    fi
done

# Clear the screen
clear

# Check and run from the selected folder
INSTALL=$(shopt -s nullglob dotglob; echo "$SELECT"/*)
if (( ${#INSTALL} )); then
    for SCRIPT in "$SELECT"/*; do
        CLEAN_OUTPUT=$(echo "$SCRIPT" | cut -d'/' -f2)
	COLOR_CLEAN_OUTPUT="$LIGHT_CYAN $CLEAN_OUTPUT $END"
        echo -e "[ ] Running post install script: $COLOR_CLEAN_OUTPUT"
        (source "$SCRIPT") > /dev/null 2>$LOGFILE
        if [ $? -ne 0 ]; then
	    echo -e "[$FAIL] Had errors running post install script: $COLOR_CLEAN_OUTPUT"
	else 
	    echo -e "[$SUCCESS] Finished running post install script: $COLOR_CLEAN_OUTPUT"
	fi
    done
else
    echo "[$FAIL] No post install scripts found." 
    echo "[$FAIL] Exiting."
    exit 1
fi

# Check if user wants to read $LOGFILE
while true; do
    read -rp "[$QUESTION] Would you like to read the log file? [y/n] " LOG
    case $LOG in
        y|Y|yes|YES|Yes ) less $LOGFILE; break;;
	    n|N|no|NO|No ) echo "[$SUCCESS] Skipping log file."; break;;
	    * ) echo "[$WARNING] Please give a valid response. ";;
    esac
done

# Check if user wants to reboot
while true; do
    read -rp "[$QUESTION] Would you like to reboot? [y/n] " REBOOT
    case $REBOOT in
        y|Y|yes|YES|Yes ) echo "[$SUCCESS] Rebooting now."; shutdown -r now; break;;
	    n|N|no|NO|No ) echo "[$SUCCESS] Skipping reboot."; break;;
	    * ) echo "[$WARNING] Please give a valid response. ";;
    esac
done