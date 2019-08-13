#! /usr/bin/bash
# copying of basic packages configuration data
# 
# parameters:
# --install-dir : installation directory

# default variables
install_dir="$HOME/Configuration"

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

# get directories of script file, necessary if running this script from other folder
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${script_dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"

# go to script dir files
cd "$script_dir"

# create if needed installation directory
mkdir -p "$install_dir"

if [ "$fix_linking_only" = false ]; then
	cp -r ../data/Configuration "$install_dir"
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
