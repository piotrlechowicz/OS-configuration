#! /usr/bin/bash
# set file linking for tmux
# 
# parameters:
# --install-dir : installation directory

# get directories of script file, necessary if running this script from other folder
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $script_dir/../common/common-script-init-settings.sh
source $script_dir/../common/common-functions.sh

# default variables
default_install_dir="$HOME"
install_dir="$HOME"

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

# create links if install_dir is different than the default one
if [ ! "$install_dir" == "$default_install_dir" ]; then
	ln -sfn "$install_dir/.tmux.conf" $default_install_dir/.tmux.conf
	ln -sfn "$install_dir/.tmux-themes" $default_install_dir/.tmux-themes
fi

echo "linking to tmux set"
