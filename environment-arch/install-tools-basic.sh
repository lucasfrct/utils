#!/bin/bash +x

## Ferramentas básicas
yay -S --noconfirm docker
yay -S --noconfirm docker-compose
yay -S --noconfirm docker-machine 0.16.2-5
yay -S --noconfirm chromium
yay -S --noconfirm google-chrome
yay -S --noconfirm foxitreader
yay -S --noconfirm zim
yay -S --noconfirm visual-studio-code-bin
yay -S --noconfirm vertex-themes
yay -S --noconfirm numix-circle-icon-theme numix-icon-theme
yay -S --noconfirm paper-gtk-theme paper-icon-theme
yay -S --noconfirm gnome-tweak-tool
yay -S --noconfirm gparted

sudo snap install spotify
sudo snap install postman

sudo systemctl start docker
sudo systemctl start docker.service
sudo systemctl enable docker
sudo systemctl enable docker.service
sudo usermod -aG docker $USER