#-------------------------
# install tmux
#-------------------------
sudo dnf install -y tmux
sh ../../app-configuration-scripts/linux/tmux/install-config.sh
sh ../../app-configuration-scripts/linux/tmux/set-linking.sh

#-------------------------
# install zsh
#-------------------------
sudo dnf install -y zsh
# fetching oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
# setting template configuration
cp ~/.oh-my-zsh/templates/zshrc/zsh-template ~/.zshrc
sh ../../app-configuration-scripts/linux/zsh/install-config.sh
sh ../../app-configuration-scripts/linux/zsh/set-linking.sh