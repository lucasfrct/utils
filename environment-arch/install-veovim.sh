#!/bin/bash +x

sudo pacman -S --noconfirm npm
sudo pacman -S --noconfirm yarn
sudo pacman -S --noconfirm nodejs
sudo pacman -S --noconfirm  rust
sudo pacman -S --noconfirm  python-neovim
yes | bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
sudo pacman -S --noconfirm neovi

source ~/.zshrc