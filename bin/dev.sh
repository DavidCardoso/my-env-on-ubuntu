#!/bin/bash

## @file dev.sh
## @brief      Functions with block with commands.
## @details    Configs and softwares for Ubuntu Linux Development enviroment
## @author     David Cardoso
## @since      January 1st, 2018
## @copyright  GNU GPL-3.0
## @sa         https://github.com/KalahariDavid/my-env-on-ubuntu/

# function install_sublime()
install_sublime(){
	show_line
	if [[ -e /usr/bin/subl ]];  then
		echo "Sublime Text is already installed!"
		exit 0
	fi

	show_line
	echo "Installing Sublime Text..."
	echo "Based on: http://www.omgubuntu.co.uk/2017/05/how-to-install-sublime-text-ubuntu-linux"
	echo

	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt update && sudo apt install sublime-text
	
	echo
	echo "...End of Sublime Text installation."
	show_line
}

# function install_docker()
install_docker(){
	show_line
	if [[ -e /usr/bin/docker ]]; then
		echo "Docker is already installed!"
		echo "Do you want to reinstall it? (Y/n)"
		read choice;
		if [[ $choice == "Y" || $choice == "y" || $choice == "yes" ]];  then
			sudo apt remove -y docker docker-engine docker.io
			sudo apt purge -y docker-ce
			sudo rm -rf /var/lib/docker
			sudo apt autoremove
		else
			exit 0
		fi
	fi

	show_line
	echo "Installing Docker CE..."
	echo "Based on: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/"
	echo

	sudo apt remove docker docker-engine docker.io
	sudo apt update
	sudo apt install apt-transport-https ca-certificates curl software-properties-common
	curl -sSL https://get.docker.com/ | sh
   	echo "[Warning] Adding '$(whoami)' user to the docker group..."
   	sudo usermod -aG docker $(whoami)
   	echo "[Warning] Testing if Docker CE was installed correctly..."
   	docker run hello-world
	
	echo
	echo "...End of Docker CE installation."
	show_line
}

# function install_docker-compose()
install_docker-compose(){
	show_line
	if [[ -e /usr/local/bin/docker-compose ]];  then
		echo "Docker Compose is already installed!"
		exit 0
	fi

	show_line
	echo "Installing Docker Compose..."
	echo "Based on: https://docs.docker.com/compose/install/#install-compose"
	echo

	sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	docker-compose --version

	echo
	echo "...End of Docker Compose installation."
	show_line
}

# function install_android-studio()
install_android-studio(){
	show_line
	if [[ -e /opt/android-studio/bin/studio.sh ]]; then
		echo "Android Studio is already installed!"
		exit 0
	fi

	show_line
	echo "Installing Android Studio..."
	echo "Based on: http://www.edivaldobrito.com.br/instalar-android-studio-no-ubuntu/"
	echo

	sudo add-apt-repository ppa:maarten-fonville/android-studio
	sudo apt update
	sudo apt install android-studio

	echo
	echo "...End of Android Studio installation."
	show_line
}

# function install_composer()
install_composer(){
	show_line
	if [[ -e /usr/local/bin/composer ]];  then
		echo "Composer is already installed!"
		exit 0
	fi

	show_line
	echo "Installing Composer..."
	echo "Based on: https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md"
	echo

	cd
	EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

	if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
	then
	    >&2 echo 'ERROR: Invalid installer signature'
	    rm composer-setup.php
	    exit 1
	fi

	php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer
	rm composer-setup.php
	
	echo
	echo "...End of Composer installation."
	show_line
}

# function install_ohmyzsh()
install_ohmyzsh(){
	show_line
	if [[ -e /usr/bin/zsh && -e ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
		echo "Oh-My-Zsh is already installed!"
		exit 0
	fi

	show_line
	echo "Installing Oh-My-Zsh..."
	echo "Based on: https://github.com/robbyrussell/oh-my-zsh/blob/master/README.md"
	echo

	if [[ ! -e /usr/bin/zsh ]]; then
		echo "Zsh is required. Do you want install it? (Y/n)"
		read choice;
		choice=$(first_letter_lower $choice)
		if [[ $choice == "y" ]]; then
			sudo apt update && apt install zsh
			sudo chsh -s $(which zsh)
			zsh --version
		fi
	fi

	if [[ -e /usr/bin/curl ]]; then
		cd
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		cd -
	else 
		if [[ -e /usr/bin/wget ]]; then
			cd
			sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
			cd -
		else
			echo "curl or wget is required. Do you want install them? (Y/n)"
			read choice;
			choice=$(first_letter_lower $choice)
			if [[ $choice == "y" ]]; then
				sudo apt update && apt install wget curl
				meou $_block $_option $_tag
			fi
		fi
	fi

	echo
	show_line
	echo "See more: https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins"

	echo
	echo "...End of Oh-My-Zsh installation."
	show_line
}

# function install_pgadmin()
install_pgadmin(){
	show_line
	if [[ -e /usr/bin/pgadmin ]]; then
		echo "PGAdmin is already installed!"
		exit 0
	fi

	show_line
	echo "Installing PGAdmin..."
	echo "Based on: https://wiki.postgresql.org/wiki/Apt"
	echo

	sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
	sudo apt update
	sudo apt install wget ca-certificates
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
	sudo apt install pgadmin3

	echo
	echo "...End of PGAdmin installation."
	show_line
}
