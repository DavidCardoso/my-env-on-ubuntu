#!/bin/bash

## @file multimedia.sh
## @brief      Functions with block with commands.
## @details    Configs and softwares for Ubuntu Linux Multimedia enviroment
## @author     David Cardoso
## @since      January 7th, 2018
## @copyright  GNU GPL-3.0
## @sa         https://github.com/KalahariDavid/my-env-on-ubuntu/

# function install_vlc()
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
