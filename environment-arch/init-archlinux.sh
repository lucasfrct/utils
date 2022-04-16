#!/bin/bash +x

## configuracao inicial
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Syy archlinux-keyring

## integracao com vscode
sudo pacman -Syyuu
sudo pacman -S --noconfirm  base-devel
sudo pacman -S --noconfirm curl
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm git