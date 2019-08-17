#-------------------------
# install tmux
#-------------------------
sudo dnf install -y tmux
sh ../../app-configuration-scripts/linux/tmux/install-config.sh

#-------------------------
# install zsh
#-------------------------
sudo dnf install -y zsh
# fetching oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
# setting template configuration
cp ~/.oh-my-zsh/templates/zshrc/zsh-template ~/.zshrc
sh ../../app-configuration-scripts/linux/zsh/install-config.sh

#-------------------------
# install vim
#-------------------------
sudo dnf install -y vim
sh ../../app-configuration-scripts/linux/vim/install-config.sh