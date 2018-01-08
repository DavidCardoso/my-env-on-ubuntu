#!/bin/bash

## @file	multimedia.sh
## @brief	Configs and softwares for Ubuntu Multimedia enviroment
## @details	Recommended after an operating system reinstall (or not :)
## @author 	David Cardoso
## @since	January 7th, 2018
## @license	GNU GPL-3.0
## @sa		https://github.com/KalahariDavid/my-env-on-ubuntu/multimedia.sh

# COMMAND LINE ARGUMENTS
_script=$0
_block=$1
_option=$2
_tag=$3

# function main()
main(){
	clear
	show_sharp_line
	echo "#  Welcome to My Env on Ubuntu! #"
	echo "#  Powered by David Cardoso.    #"
	show_sharp_line
	echo
	echo "  Running $_script script..."
	echo

	# case BLOCK
	case $_block in
		vlc)
			# case OPTION
			case $_option in
				--install)
					install_$_block
					;;
				*)
					confirm_install
					;;
			esac
			;;
		*)
			# default case
			show_help
			exit  0
			;;
	esac
}

# function show_help()
show_help(){
	show_line
	echo "Please, inform a BLOCK of commands to run."
	echo "Optionally, you can inform an OPTION and a TAG."
	echo
	echo "Example: "
	echo "$_script vlc --install --log"
	echo
}

# function confirm_install()
confirm_install(){
	echo "Do you want to install $_block? (Y/n)"
	read choice
	if [[ $choice == "Y" || $choice == "y" || $choice == "yes" ]];  then
		install_$_block
	else
		echo "...Exiting!"	
	fi
}

# function confirm_continue()
confirm_continue(){
	echo "Continue? (Y/n)"
   	read choice;
   	if [[ $choice != "Y" || $choice != "y" || $choice != "yes" ]];  then
		exit 0
	fi
}

# function install_docker()
install_vlc(){
	show_line
	if [[ -e /usr/bin/vlc ]]; then
		echo "VLC is already installed!"
		exit 0
	fi

	echo "Installing VLC..."
	echo "Based on: http://www.edivaldobrito.com.br/como-instalar-a-ultima-versao-do-vlc/"
	echo "Tested on: Ubuntu 17.10 (artful)"


	sudo add-apt-repository ppa:nicola-onorata/desktop
	sudo apt update
	sudo apt install vlc

	echo
	echo "...End of VLC Installation."
	show_line
}

# function show_sharp_line()
show_sharp_line(){
	echo "#################################"
}

# function show_line()
show_line(){
	echo "---------------------------------"
}

# calling main() function
main