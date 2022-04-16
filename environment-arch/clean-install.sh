# !/bin/bash +x

## habiliatando sudo
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

# adicioanando novo usuario
# useradd -m -G wheel -s /bin/bash development
# passwd -d development
# whoami

## configuracao inicial
# sudo pacman-key --init
# sudo pacman-key --populate
# sudo pacman -Syy archlinux-keyring


## integracao com vscode
sudo pacman -Syyuu
sudo pacman -S wget