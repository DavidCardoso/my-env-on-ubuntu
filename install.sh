#!/bin/bash

## @file install.sh
## @brief      Default configs for 'My Env on Ubuntu'
## @author     David Cardoso
## @since      January 8th, 2018
## @copyright  GNU GPL-3.0
## @sa         https://github.com/DavidCardoso/my-env-on-ubuntu/

# COMMAND LINE ARGUMENTS
_script=$0 # name of this script
_arg1=$1   # first argument
_pwd=$(pwd)
_user=$(whoami)

# variables
_prefix="[MEOU]"

# importing functions
. ./bin/helpers.sh

# header
show_header "install.sh"

# setting up the symbolic link to bin path
show_line
echo "$_prefix Creating symbolic link 'meou' on /usr/local/bin/ path..."
if [[ $_user != "root" ]]; then
    sudo rm /usr/local/bin/meou
    sudo ln -s $_pwd/bin/meou.sh /usr/local/bin/meou
else
    rm /usr/local/bin/meou
    ln -s $_pwd/bin/meou.sh /usr/local/bin/meou
fi

# adding execution permission to the scripts in bin path
show_line
echo "$_prefix Adding execution permission to the scripts in $_pwd/bin path..."
chmod +x ./bin/*.sh

# setting up the user profile configs (to be persistent between users logins sessions)
show_line
_msg="$_prefix Setting up the user profile configs (to be persistent between users logins sessions)..."
echo $_msg
echo "
# $_msg
if [[ \$(whoami) == $_user ]]; then
	export MEOUPATH=$_pwd
fi" >>./txt/configs.txt
for _profiles in ~/.*rc; do
    cat ./txt/configs.txt >>$_profiles
done
export MEOUPATH=$_pwd
rm -f ./txt/configs.txt

# End of installation
show_line
echo "Congratulations! Now you have 'My Env on Ubuntu' installed!"
echo
show_mascot
echo
echo "Run 'meou --help' for more information!"
echo
echo "* If you face some troubles try restarting your user session (logout/login)."
echo "* If still does not work properly try rebooting your system."
echo

# TODO: handle multiple 'source install.sh' executions
