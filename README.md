# My Env on Ubuntu CLI
Softwares installation and Configs for Ubuntu Linux Enviroment.

			     ██          ██
			     █▒█        █▒█
			    █▒███    ███▒█
			    █▒████████▒▒█
			    █▒████▒▒█▒▒██
			    ████▒▒▒▒▒████
			     █▒▒▒▒▒▒▒████
			    █▒▒▒▒▒▒▒▒████      █
			   ██▒█▒▒▒▒▒█▒▒████  █▒█
			   █▒█●█▒▒▒█●█▒▒███ █▒▒█
			   █▒▒█▒▒▒▒▒█▒▒▒██ █▒▒█
			    █▒▒▒=▲=▒▒▒▒███ ██▒█
			    ██▒▒█♥█▒▒▒▒███  ██▒█
			      ███▒▒▒▒████    █▒█
			        ██████        ███
			         █▒▒████      ██
			         █▒▒▒▒▒████  ██
			         █▒██▒██████▒█
			         █▒███▒▒▒█████
			       █▒████▒▒▒▒████
			        █▒███▒██████  

# Description
- **My Env on Ubuntu** is a _Command Line Tool_ that makes easier to set up and to  install some softwares on Ubuntu Linux Enviroment via CLI.
- Install, configure, refresh and remove things on your Ubuntu Linux enviroment.
- It is very helpful after an operating system reinstall (or not :)

# Installing
- $ mkdir -p $HOME/dev/shell/ && cd $_ 
	- or just navigate to your desired folder
- $ git clone https://github.com/KalahariDavid/my-env-on-ubuntu
- $ cd my-env-on-ubuntu
- $ source install.sh

# Instructions
## Usage:
- meou [BLOCK]
- meou [BLOCK] [OPTION]
- meou [BLOCK] [OPTION] [TAG]

- Example:
	- ```meou sublime --install```

## Help:
- **--help** 		Show this help message

## Application Options:
- **--version** 	Print the version and exit
- **--install** 	Install the software related to the [BLOCK] chosen 

## Available Block of commands:
- **sublime**: 		Sublime Text IDE
- **docker**: 		Docker Community Edition (apps via containers)
- **docker-compose**: Docker Compose (CLI for Docker) 
- **android-studio**: Android Studio IDE
- **composer**: 	PHP package manager
- **vlc**: 			Media Player with some standards codecs 
- **ohmyzsh**: 		Oh My Zsh (Framework Zshell)
- **virtualbox**: 		VirtualBox (Virtual Machines)

