#!/bin/bash

## @file 	   meou.sh
## @brief      Softwares installation and Configs for Ubuntu Linux Enviroment via CLI
## @author     David Cardoso
## @since      January 8th, 2018
## @copyright  GNU GPL-3.0
## @sa         https://github.com/KalahariDavid/my-env-on-ubuntu/

# COMMAND LINE ARGUMENTS
_argc=$# # count of arguments
_script=$0 # name of this script
_block=$1 # block of commands to run
_option=$2 # option related to the block
_tag=$3 # tag to modify some behavior of the execution

# importing functions
. $MEOUPATH/bin/helpers.sh
. $MEOUPATH/bin/dev.sh
. $MEOUPATH/bin/multimedia.sh
. $MEOUPATH/bin/others.sh

# function main()
main(){
	# header
	show_header "$MEOUPATH/bin/meou.sh"

	# which BLOCK must be runned
	case $_block in
		# Sublime Text (IDE)
		sublime)
			case_option 'software' $_option
			;;
		# Docker CE (container manager)
		docker)
			case_option 'software' $_option
			;;
		# Docker Compose (CLI for Docker)
		docker-compose)
			case_option 'software' $_option
			;;
		# Android Studio (IDE)
		android-studio)
			case_option 'software' $_option
			;;
		# Composer (PHP package manager)
		composer)
			case_option 'software' $_option
			;;
		# VLC (media player with codecs)
		vlc)
			case_option 'software' $_option
			;;
		# Oh My Zsh (Framework Zsh)
		ohmyzsh)
			case_option 'software' $_option
			;;
		# VirtualBox (Virtual Machines)
		virtualbox)
			case_option 'software' $_option
			;;
		# PGAdmin (Postgres GUI)
		pgadmin)
			case_option 'software' $_option
			;;
		# default case
		*)
			case $_argc in
				0)
					case_option 'default' '--help'
					;;
				1)
					case_option 'default' $_block
					;;
				2)
					case_option 'default' $_option
					;;
				3)
					case_option 'default' $_option
					;;
				*)
					echo 'Please, inform until three arguments:'
					echo 'e.g. 0 => meou'
					echo 'e.g. 1 => meou [BLOCK]'
					echo 'e.g. 2 => meou [BLOCK] [OPTION]'
					echo 'e.g. 3 => meou [BLOCK] [OPTION] [TAG]'
					;;
			esac
			echo
			echo '...Exiting!'
			exit 0
			;;
	esac
}

# calling main() function
main