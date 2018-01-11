#!/bin/bash

## @file meou.sh
## @brief      Softwares installation and Configs for Ubuntu Linux Enviroment via CLI
## @author     David Cardoso
## @since      January 8th, 2018
## @copyright  GNU GPL-3.0
## @sa         https://github.com/KalahariDavid/my-env-on-ubuntu/

# COMMAND LINE ARGUMENTS
_script=$0 # name of this script
_block=$1 # block of commands to run
_option=$2 # option related to the block
_tag=$3 # tag to modify some behavior of the execution

# importing functions
. $MEOUPATH/bin/dev.sh
. $MEOUPATH/bin/multimedia.sh

# function main()
main(){
	clear
	show_sharp_line
	echo "#  Welcome to My Env on Ubuntu! #"
	echo "#  Powered by David Cardoso.    #"
	show_sharp_line
	echo
	echo "See also: https://github.com/KalahariDavid/my-env-on-ubuntu"
	echo
	echo "  Running $MEOUPATH/bin/meou.sh script..."
	echo

	# which BLOCK must be runned
	case $_block in
		# Sublime Text (IDE)
		sublime)
			case_option
			;;
		# Docker CE (container manager)
		docker)
			case_option
			;;
		# Android Studio (IDE)
		android-studio)
			case_option
			;;
		# Composer (PHP package manager)
		composer)
			case_option
			;;
		# VLC (media player with codecs)
		vlc)
			case_option
			;;
		# default case
		*)
			show_help
			exit  0
			;;
	esac
}

# function show_help()
show_help(){
	show_line
	cat $MEOUPATH/txt/help.txt
	echo
}

# function confirm_install()
confirm_install(){
	echo "Do you want to install $_block? (Y/n)"
	read choice
	if [[ $choice == "Y" || $choice == "y" || $choice == "yes" ]];  then
		install_$_block
	else
		echo "...Not installed!"	
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

# function case_option()
case_option(){
	case $_option in
		--install)
			install_$_block
			;;
		*)
			confirm_install
			;;
	esac
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