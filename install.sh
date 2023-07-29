#!/usr/bin/bash

# Colors
normal='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
orange='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
lightred='\033[1;31m'
lightgreen='\033[1;32m'
lightblue='\033[1;34m'
lightpurple='\033[1;35m'
lightcyan='\033[1;36m'
white='\033[1;37m'

# Check if we are running from Termux
if [ -z "$TERMUX_VERSION" ]; then
    printf "${red}Termux hasn't been detected. Are you sure you have installed and are running it?${normal}"
    exit 1
fi

# Check if old Revancify is present
if [[ -d $HOME/Revancify ]]; then
    printf "${orange}Old Revancify installation has been detected. Problems may occur${normal}"
fi

# Update all the packages
printf "Updating packages..."
pkg update && pkg upgrade -y

# Download Git
if ! command -v git &> /dev/null; then
    pkg install -y git
fi

# Download Revancify X
if git clone --depth=1 https://github.com/kastentop2005/Revancify-X RevancifyX; then
    printf "${green}Revancify X has been successfully installed! Launching${normal}\n"
    sleep 2
    ./RevancifyX/revx
else
    echo "${red}Couldn't download required resources. Can't proceed${normal}"
    exit 1
fi
