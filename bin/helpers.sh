#!/bin/bash

## @file helpers.sh
## @brief      Helper Functions with block with commands.
## @author     David Cardoso
## @since      January 11th, 2018
## @copyright  GNU GPL-3.0
## @sa         https://github.com/KalahariDavid/my-env-on-ubuntu/

# function case_option()
case_option(){
	case $2 in
		--install)
			install_$_block
			;;
		--help)
			show_help
			;;
		--version)
			show_version
			;;
		--mascot)
			show_mascot
			;;
		"")
			if [[ $1 == 'software' ]]; then
				confirm_install
			else
				echo '...No matched option!'
			fi
			;;
		*)
			echo '...No matched option!'
			;;
	esac
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

# function show_help()
show_help(){
	show_line
	cat $MEOUPATH/txt/help.txt
	echo
}

# function show_version()
show_version(){
	show_mascot
	echo
	show_line
	cd $MEOUPATH && git fetch -vp 2&> /dev/null
	echo "Version: "
	git tag -l --sort=v:refname | egrep v. | tail -1
	show_line
	cd - 2&> /dev/null
	echo
}

# function show_mascot()
show_mascot(){
	cat $MEOUPATH/txt/mascot.txt
	echo 
}

# function show_sharp_line()
show_sharp_line(){
	echo "#################################"
}

# function show_line()
show_line(){
	echo "---------------------------------"
}

# function show_header()
show_header(){
	clear
	show_sharp_line
	echo "#  Welcome to My Env on Ubuntu! #"
	echo "#  Powered by David Cardoso.    #"
	show_sharp_line
	echo
	echo "See also: https://github.com/KalahariDavid/my-env-on-ubuntu"
	echo
	echo "  Running $1 script..."
	echo
}

# function first_letter_lower
first_letter_lower(){
	result=$(echo $1 | tr '[:upper:]' '[:lower:]' | cut -b1)
	echo $result
}
