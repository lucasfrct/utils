#!/bin/bash +x

## configuracao inicial
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Syy --noconfirm archlinux-keyring
find . -type f -name "*.sh" -exec chmod +x {} \; 

## ferramentas essenciais do sistema
yes | sudo pacman -Syyuu
sudo pacman -S --noconfirm --needed base-devel
sudo pacman -S --noconfirm openssh openssl
sudo pacman -S --noconfirm wavpack libdv libmad 
sudo pacman -S --noconfirm gst-libav libdvdnav fuse-exfat 
sudo pacman -S --noconfirm libvorbis faac libdvdcss lame 
sudo pacman -S --noconfirm libmpeg2 libtheora libxv 
sudo pacman -S --noconfirm libdvdread exfat-utils a52dec faad2 
sudo pacman -S --noconfirm flac jasper gstreamer
sudo pacman -S --noconfirm curl
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm gufw
sudo pacman -S --noconfirm ufw
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm github-cli
sudo pacman -S --noconfirm vim
sudo pacman -S --noconfirm vlc
sudo pacman -S --noconfirm pavucontrol
sudo pacman -S --noconfirm snapd
yes | sudo pacman -Syyuu

## Ativando os serviços
sudo ufw enable
sudo systemctl enable ufw
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap