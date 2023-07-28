#!/usr/bin/bash

servers=("google.com" "raw.githubusercontent.com")

for server in "${servers[@]}"; do
    if ! ping -c 1 -W 3 "$server"&> /dev/null; then
        echo -e "\e[1;31m$server is not reachable with your current network.\nChange your network configuration\e[0m"
    fi
done

if [ -z "$TERMUX_VERSION" ]; then
    echo -e "\e[1;31mTermux hasn't been detected!\e[0m\n\e[1;31mInstallation has been aborted!\e[0m"
    exit 1
fi

if [ -d "$HOME/RevancifyX" ]; then
    ./RevancifyX/revx
    exit 0
fi

if ! command -v git &> /dev/null; then
    if ! pkg update -y -o Dpkg::Options::="--force-confnew"; then
        echo -e "\e[1;31mOops !!
Possible causes of error:
1. Termux from Play Store is not maintained. Download Termux from GitHub.
2. Unstable internet Connection.
3. Repository issues. Clear Termux Data and retry."
        exit 1
    fi
    pkg install git -y -o Dpkg::Options::="--force-confnew"
fi

if git clone --depth=1 https://github.com/kastentop2005/Revancify-X.git; then
    ./RevancifyX/revx
else
    echo -e "\e[1;31mInstallation failed!\e[0m"
    echo "Please try again"
    exit 1
fi
