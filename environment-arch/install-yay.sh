#!/bin/bash +x

## install yay
localPath=$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")
cd /tmp && cd -Rf yay-git
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chmod 777 -R ./yay-git
cd yay-git
yes | makepkg -si
yes | yay -Syu
yay -Syu --noconfirm --devel --timeupdate
yes | yay -Yc
cd $localPath