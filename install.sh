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

servers=("google.com" "raw.githubusercontent.com")

for server in "${servers[@]}"; do
    if ! ping -c 1 -W 3 "$server"&> /dev/null; then
        echo -e "\e[1;31m$server is not reachable with your current network.\nChange your network configuration.\e[0m"
    fi
done

if [ -z "$TERMUX_VERSION" ]; then
    printf "${red}Termux hasn't been detected. Are you sure you have installed and are running it?${normal}"
    exit 1
fi

if [[ -d $HOME/Revancify ]]; then
    printf "${orange}Old Revancify installation has been detected. Problems may occur${normal}"
    echo -e "\n1.Proceed wih installation\n2.Delete Revancify and proceed.\n3.Exit"
    read -p "> " choice
    if [ -z $choice ]; then
        echo -e "No option Selected. Exiting...."
        exit 1
    elif [ $choice == 1 ];then
        echo "Continuing Installation of RevancifyX."
    elif [ $choice == 2 ];then
        echo "Deleting Revancify."
        rm -rf $HOME/Revancify
        echo -e "Done\nProceeding with installation."
    elif [ $choice == 3 ];then
        exit 1
    else
        echo "Invalid Input. Exiting...."
        exit 1
    fi
 fi
 
if [ -d "$HOME/RevancifyX" ]; then
    bash $HOME/RevancifyX/revx
    exit 0
fi

if ! command -v git &> /dev/null; then
    if ! pkg update -y -o Dpkg::Options::="--force-confnew"; then
        echo -e "\e[1;31mOops !!
Possible causes of error:
1. Termux from Playstore is not maintained. Download Termux from github.
2. Unstable internet Connection.
3. Repository issues. Clear Termux Data and retry."
        exit 1
    fi
    pkg install git -y -o Dpkg::Options::="--force-confnew"
fi

if git clone --branch testing --depth=1 https://github.com/kastentop2005/Revancify-X $HOME/RevancifyX; then
    bash $HOME/RevancifyX/revx
else
    echo -e "${red}Couldn't download required resources. Can't proceed${normal}"
    echo "Please Try again"
    exit 1
fi
