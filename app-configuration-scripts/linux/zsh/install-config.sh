#! /usr/bin/bash
# copying of zsh configuration data
# 
# parameters:
# --install-dir : installation directory

# get directories of script file, necessary if running this script from other folder
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $script_dir/../common/common-script-init-settings.sh
source $script_dir/../common/common-functions.sh

# default variables
install_dir="$HOME"
data_location=$script_dir/data

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
# create if needed installation directory
mkdir -p "$install_dir"

# backup .zshrc
config_file=~/.zshrc
if [ -f $config_file ]; then
	if [ ! -f $config_file.bak ]; then
		cp $config_file $config_file.bak
	fi
fi

# go to script dir
cd "$script_dir"
# copy required files
cp -r $data_location/. "$install_dir/"

echo "zsh config set"

sh ./set-linking.sh

