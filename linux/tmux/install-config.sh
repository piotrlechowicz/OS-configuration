#! /usr/bin/bash
# installation of tmux configuration
# 
# parameters:
# --install-dir : installation directory


# default variables
install_dir="$HOME/Configuration"
default_config_file="~/.tmux.conf" 
config_dir_name="tmux"
linking_config_file_location="tmux/.tmux.conf"
fix_linking_only=false # only fix linking to files, do not install anything

# get install dir from parameters
while [ "$1" != "" ]; do
	case $1 in 
		-id | --install-dir ) 			shift 
										install_dir="$1"
										;;
		-flo | --fix-linking-only )   	fix_linking_only=true
										;;
	esac
	shift
done

# assure absolute installation path
install_dir=$(readlink -f $install_dir)

# get directories of script file, necessary if running this script from other folder
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${script_dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"

# source some common files
cd "$script_dir"
source ../common/common-script-init-settings.sh
source ../common/common-functions.sh

# create if needed installation directory
mkdir -p "$install_dir"

if [ "$fix_linking_only" = false ]; then
	# copy required files
	cp -r ./data "$install_dir"
fi

# create default config file if not exists
if [ ! -f $default_config_file ]; then
	touch $default_config_file
else # otherwise create backup
	cp $default_config_file $default_config_file.bak
fi

expression="source-file $install-dir/$linking_config_file_location"
append_to_file_if_not_exist "$expression" "$default_config_file"

# append linking to theme folder
ln -s "$install_dir/$config_dir_name/" ~/.tmux-conf-dir

# sourcing tmux config within application
tmux new-session -d -s my_session "source-file ~/.tmux.conf"
