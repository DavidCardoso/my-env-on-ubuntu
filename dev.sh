#!/bin/bash

## @file	dev.sh
## @brief	Configs and softwares for Ubuntu development enviroment
## @details	Recommended after an operating system reinstall (or not :)
## @author 	David Cardoso
## @since	January 1st, 2018
## @license	GNU GPL-3.0
## @sa		https://github.com/KalahariDavid/my-env-on-ubuntu/dev.sh

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
		sublime)
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
		docker)
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
		android-studio)
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
	echo "$_script sublime --install --log"
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

# function install_sublime()
install_sublime(){
	show_line
	if [[ -e /usr/bin/subl ]];  then
		echo "Sublime Text is already installed!"
		exit 0
	fi

	echo "Installing Sublime Text..."
	echo "Based on: http://www.omgubuntu.co.uk/2017/05/how-to-install-sublime-text-ubuntu-linux"
	
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt update && sudo apt install sublime-text
	
	echo
	echo "...End of Sublime Text Installation."
	show_line
}

# function install_docker()
install_docker(){
	show_line
	if [[ -e /usr/bin/docker ]]; then
		echo "Docker is already installed!"
		exit 0
	fi

	echo "Installing Docker CE..."
	echo "Based on: https://"

	echo
	echo "...End of Docker CE Installation."
	show_line
}

# function install_docker()
install_android-studio(){
	show_line
	if [[ -e /opt/android-studio/bin/studio.sh ]]; then
		echo "Android Studio is already installed!"
		exit 0
	fi

	echo "Installing Android Studio..."
	echo "Based on: http://www.edivaldobrito.com.br/instalar-android-studio-no-ubuntu/"

	sudo add-apt-repository ppa:maarten-fonville/android-studio
	sudo apt update
	sudo apt install android-studio

	echo
	echo "...End of Android Studio Installation."
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