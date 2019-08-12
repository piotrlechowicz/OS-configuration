#! /usr/bin/bash
sudo apt-get install -y zsh
# fetching oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

cp ~/.oh-my-zsh/templates/zshrc/zsh-template ~/.zshrc
