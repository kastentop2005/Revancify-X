#!/usr/bin/bash

# Colors
normal='\033[0m'
lightred='\033[1;31m'
lightgreen='\033[1;32m'
lightblue='\033[1;34m'

# Check if we are running from Termux session
if [ -z "$TERMUX_VERSION" ]; then
	printf "${red}Termux hasn't been detected. Are you sure you have installed and are running it?${normal}\n"
	exit 1
fi

# Check for internet connection
servers=("google.com" "raw.githubusercontent.com")
for server in "${servers[@]}"; do
	if ! ping -c 1 -W 3 "$server"&> /dev/null; then
		printf "${lightred}Can't connect to network. Make sure your connection is stable and nothing is blocking it${normal}\n"
		exit 1
	fi
done

# Update repositores
printf "${lightblue}Please wait... Updating repositores${normal}\n"
if ! pkg update -y -o Dpkg::Options::="--force-confnew" &> /dev/null; then
	printf "${lighred}Unable to update repositories. Check your network or try running 'termux-change-repo'${normal}\n"
	exit 1
fi

# Download git
if ! command -v git &> /dev/null; then
	printf "${lightblue}Downloading git...${normal}\n"
	if ! pkg install -y git &> /dev/null; then
		printf "${lightred}Unable to download Git. Make sure you got stable internet connection${normal}\n"
		exit 1
	fi
fi

# Check for existing Revancify installations
if [[ -d $HOME/Revancify ]] && [[ ! -d $HOME/RevancifyX ]]; then
	printf "Existing Revancify installation has been detected. Do you want to delete it first?\n"
	read -r -p "[Y/N]: " choice
	case $choice in
		[Yy]*) printf "Deleting...\n"
		rm -rf $HOME/Revancify
		[[ -d $HOME/Revancify-data ]] && rm -rf $HOME/Revancify-data;;
		[Nn]*) printf "${lightred}This may cause problems in future${normal}\n";;
		*) printf "${lightred}Not a correct answer${normal}\n";;
	esac
elif [[ ! -d $HOME/Revancify ]] && [[ -d $HOME/RevancifyX ]]; then
	printf "Existing Revancify X installation has been detected. Do you want to delete it first?\n"
	read -r -p "[Y/N]: " choice
	case $choice in
		[Yy]*) printf "Deleting...\n"
		rm -rf $HOME/RevancifyX
		[[ -d $HOME/RevancifyX-data ]] && rm -rf $HOME/RevancifyX-data;;
		[Nn]*) printf "${lightred}This may cause problems in future${normal}\n";;
		*) printf "${lightred}Not a correct answer${normal}\n";;
	esac
elif [[ -d $HOME/Revancify ]] && [[ -d $HOME/RevancifyX ]]; then
	printf "Existing Revancify X installation has been detected. Do you want to delete it first?\n"
	read -r -p "[Y/N]: " choice
	case $choice in
		[Yy]*) printf "Deleting...\n"
		rm -rf $HOME/Revancify && rm -rf $HOME/RevancifyX
		[[ -d $HOME/Revancify-data ]] && rm -rf $HOME/Revancify-data
		[[ -d $HOME/RevancifyX-data ]] && rm -rf $HOME/RevancifyX-data;;
		[Nn]*) printf "${lightred}This may cause problems in future${normal}\n";;
		*) printf "${lightred}Not a correct answer${normal}\n";;
	esac
fi

# Download Revancify X
printf "${lightblue}Downloading Revacify X...${normal}\n"
if ! git clone --branch testing --single-branch --depth=1 https://github.com/kastentop2005/Revancify-X $HOME/RevancifyX &> /dev/null; then
	printf "${red}Couldn't download Revancify X. Make sure your internet connection is stable${normal}\n"
	exit 1
else
	cp $HOME/RevancifyX/revx /data/data/com.termux/files/usr/bin/revx
 	chmod u+x /data/data/com.termux/files/usr/bin/revx
	printf "${lightgreen}Revancify X has been installed successfully! Launching...${normal}\n"
	sleep 3
	revx
fi
