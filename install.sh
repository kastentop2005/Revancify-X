#!/usr/bin/bash

# Colors
normal='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
orange='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
lightgray='\033[0;37m'
darkgray='\033[1;30m'
lightred='\033[1;31m'
lightgreen='\033[1;32m'
lightblue='\033[1;34m'
lightpurple='\033[1;35m'
lightcyan='\033[1;36m'
white='\033[1;37m'

# Check for existing Revancify installation
if [ -d "$HOME/Revancify" ]; then
    printf"${orange}Existing Revancify installation has been detected
It is recommended that you delete it. Delete?${normal}
[Y/N]: "
    read choice
    case choice in
    Y | y)
        printf "Deleting Revancify..."
        rm -rf $HOME/Revancify $HOME/revancify-data
        ;;
    N | n)
        printf "Continuing..."
        ;;
    *)
        printf "Invalid option selected"
        exit 1
    esac
fi

# Check for working internet connection
wget -q --spider http://google.com
if [ ! $? -eq 0 ]; then
    printf "${red}Can't connect to the internet! Aborting..."
    exit 1
fi

# Check if we are running from Termux
if [ -z "$TERMUX_VERSION" ]; then
    printf "${red}Termux hasn't been detected. Are you sure you have installed and are running it?${normal}"
    exit 1
fi

# Check for Revancify X installation
if [ -d "$HOME/RevancifyX" ]; then
    printf "${lightblue}Revancify X is already installed, run it with \'revx\' command${normal}"
    exit 0
fi

if ! command -v git &> /dev/null; then
    if ! pkg update -y -o Dpkg::Options::="--force-confnew"; then
        printf
        "${red}Couldn't update packages. Make sure you have installed Termux from GitHub. Otherwise, your connection might be unstable${normal}"
        exit 1
    fi
    pkg install git -y -o Dpkg::Options::="--force-confnew"
fi

# Download Revancify X
if git clone --depth=1 https://github.com/kastentop2005/Revancify-X; then
    mv Revancify-X/ RevancifyX/
    printf "${green}Revancify X has been successfully installed!${normal}
${lightblue}Run it with \'revx\' command${normal}\n"
else
    echo "${red}Couldn't download required resources. Can't proceed${normal}"
    exit 1
fi
