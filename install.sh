#!/bin/bash

## @file install.sh
## @brief      Default configs for 'My Env on Ubuntu'
## @author     David Cardoso
## @since      January 8th, 2018
## @copyright  GNU GPL-3.0
## @sa         https://github.com/KalahariDavid/my-env-on-ubuntu/

# COMMAND LINE ARGUMENTS
_script=$0 # name of this script
_arg1=$1 # first argument

# importing functions
. ./bin/helpers.sh

# header
show_header "install.sh"

# setting up the symbolic link to bin path
show_line
echo "Creating symbolic link 'meou' on /usr/local/bin/ path..."
sudo rm /usr/local/bin/meou
sudo ln -s $(pwd)/bin/meou.sh /usr/local/bin/meou

# adding execution permission to the scripts in bin path
show_line
echo "Adding execution permission to the scripts in $PWD/bin path..."
chmod +x ./bin/*.sh

# setting up the user profile configs (to be persistent between users logins sessions)
show_line
echo "Setting up the user profile configs (to be persistent between users logins sessions)..."
_bash="#!/bin/bash"
echo "$_bash
if [[ \$USER == $USER ]]; then
	export MEOUPATH=$PWD
fi" > ./txt/configs.txt
sudo cp ./txt/configs.txt /etc/profile.d/my-env-on-ubuntu-configs-$USER.sh
export MEOUPATH=$PWD
rm -f ./txt/configs.txt

# End of installation
show_line
echo "Congratulations! Now you have 'My Env on Ubuntu' installed!"
echo
show_mascot
echo
echo "Run 'meou --help' for more information!"
echo
