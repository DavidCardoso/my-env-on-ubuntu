#!/bin/bash

## @file others.sh
## @brief      Functions with block with commands.
## @details    Configs and softwares for Ubuntu Linux enviroment
## @author     David Cardoso
## @since      February 2th, 2018
## @copyright  GNU GPL-3.0
## @sa         https://github.com/KalahariDavid/my-env-on-ubuntu/

# function install_vlc()
install_virtualbox(){
    show_line
    if [[ -e /usr/bin/virtualbox ]]; then
        echo "VirtualBox is already installed!"
        exit 0
    fi

    echo "Installing VirtualBox..."
    echo "Based on: http://www.edivaldobrito.com.br/virtualbox-no-linux/"
    echo "Tested on: Ubuntu 17.10 (artful)"
    echo

    sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo apt update
    sudo apt remove virtualbox virtualbox-5.0 virtualbox-4.*
    sudo apt install virtualbox

    echo
    echo "...End of VirtualBox Installation."
    show_line
}
