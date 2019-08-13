#! /usr/bin/bash
# set file linking for configuration data
# 
# parameters:
# --install-dir : installation directory

# get directories of script file, necessary if running this script from other folder
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $script_dir/../common/common-script-init-settings.sh
source $script_dir/../common/common-functions.sh

# default variables
install_dir="$HOME"
data_dir=Configuration/linux/tmux

# get install dir from parameters
while [ "$1" != "" ]; do
	case $1 in 
		-id | --install-dir ) 			shift 
										install_dir="$1"
										;;
	esac
	shift
done

# assure absolute installation path
install_dir=$(readlink -f $install_dir)

default_config_file=~/.tmux.conf

# create default config file if not exists
if [ ! -f $default_config_file ]; then
	touch $default_config_file
else # otherwise create backup
	if [ ! -f $default_config_file.bak ]; then
		cp $default_config_file $default_config_file.bak
	fi
fi

expression="source-file $install_dir/$data_dir/.tmux.conf"
append_to_file_if_not_exist "$expression" "$default_config_file"

# append linking to theme folder
ln -sfn "$install_dir/$data_dir" ~/.tmux-conf-dir

# sourcing tmux config within application
tmux new-session -d -s my_session "source-file ~/.tmux.conf"

echo "linking to tmux set"