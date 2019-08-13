# assure earlier that all folders and files are available
local win_home=/mnt/d/

ln -s /mnt/d/Configuration/wsl/.vimrc ~/.vimrc
unix2dos /mnt/d/Configuration/wsl/.vimrc

ln -s /mnt/d/Configuration/wsl/.zshrc ~/.zshrc
ln -s /mnt/d/Configuration/wsl/.my-zsh-themes ~/.my-zsh-themes
ln -s /mnt/d/Configuration/wsl/.tmux.conf ~/.tmux.conf
ln -s /mnt/d/Configuration/wsl/.tmux-white-theme ~/.tmux-white-theme
