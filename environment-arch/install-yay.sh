#!/bin/bash +x

## install yay
cd /tmp
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chmod 777 -R ./yay-git
cd yay-git
makepkg -si
sudo yay -Syu
yay -Syu --noconfirm  --devel --timeupdate
sudo yay -S --noconfirm  gparted
sudo yay -Yc