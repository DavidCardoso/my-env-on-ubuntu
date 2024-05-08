#!/bin/bash

## @file others.sh
## @brief      Functions with block with commands.
## @details    Configs and softwares for Ubuntu Linux enviroment
## @author     David Cardoso
## @since      February 2th, 2018
## @copyright  GNU GPL-3.0
## @sa         https://github.com/KalahariDavid/my-env-on-ubuntu/

# function install_virtualbox()
install_virtualbox() {
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

# function install_guake()
install_guake() {
    show_line
    if [[ -e /usr/bin/guake ]]; then
        echo "Guake is already installed!"
        exit 0
    fi

    echo "Installing Guake..."
    echo "Based on: http://guake.readthedocs.io/en/stable/user/installing.html#system-wide-installation"
    echo "Tested on: Ubuntu 17.10 (artful)"
    echo

    sudo apt update
    sudo apt install guake

    echo
    echo "...End of Guake Installation."
    show_line
}

# function install_1password()
install_1password() {
    show_line
    if [[ -e /usr/bin/1password ]]; then
        echo "1password is already installed!"
        exit 0
    fi

    echo "Installing 1password..."
    echo "Based on: https://support.1password.com/install-linux/#debian-or-ubuntu"
    echo "Tested on: Ubuntu 24.04 LTS"
    echo

    echo
    echo "Adding apt repository, the respective key, and debsig-policy."
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

    echo
    echo "Updating the apt cache and initiating the installation..."
    sudo apt update && sudo apt install 1password

    echo
    echo "...End of 1password Installation."
    show_line
}
