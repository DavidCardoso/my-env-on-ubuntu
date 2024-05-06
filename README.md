# My Env on Ubuntu CLI

This project helps with installation and configs for tools on Ubuntu Linux Environment.

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

## Description
- **My Env on Ubuntu** is a _Command Line Tool_ that makes easier to set up and install some softwares on Ubuntu Linux Enviroment.
- Install, configure, refresh and remove things on your Ubuntu Linux enviroment.
- It is very helpful after an operating system reinstall (or not :)

# Installing

```shell
# create/navigate to your desired folder
mkdir -p $HOME/dev/shell/ && cd $_
git clone https://github.com/DavidCardoso/my-env-on-ubuntu
cd my-env-on-ubuntu
source install.sh
```

## Usage:

```shell
meou [BLOCK]
meou [BLOCK] [OPTION]
meou [BLOCK] [OPTION] [TAG]

# Example
meou sublime --install
```


## Options:
- `--help` 		Show this help message
- `--version` 	Print the version
- `--install` 	Install the software related to the [BLOCK] chosen

> The `--install` option is the default one and optional. Therefore `meou sublime` will have the same behavior.

## Available Block of commands:
- `sublime`: 		Sublime Text IDE - https://www.sublimetext.com
- `docker`: 		Docker Community Edition - https://www.docker.com
- `android-studio`: Android Studio IDE - https://developer.android.com/studio
- `composer`: 	    PHP package manager - https://getcomposer.org
- `vlc`: 			Media Player with some standard codecs - https://www.videolan.org/vlc
- `ohmyzsh`: 		Oh My Zsh (zshell framework) - https://ohmyz.sh
- `virtualbox`: 	Virtual Machines - https://www.virtualbox.org
- `pgadmin`: 		Postgres GUI - https://www.pgadmin.org
- `guake`: 		    Guake Terminal - https://guake.github.io
- `code`: 		    Visual Studio Code - https://code.visualstudio.com
- `1password`: 	    Password manager - https://1password.com
