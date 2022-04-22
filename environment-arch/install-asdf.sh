#!/bin/bash +x

## Versionador ASDF VM
yay -S --noconfirm asdf-vm
grep -qxF 'source /opt/asdf-vm/asdf.sh' ~/.zshrc || echo 'source /opt/asdf-vm/asdf.sh' >>~/.zshrc
grep -qxF 'source /opt/asdf-vm/asdf.sh' ~/.bashrc || echo 'source /opt/asdf-vm/asdf.sh' >>~/.bashrc

## Atualiza YAY
asdf plugin add yay
asdf install yay latest

source ~/.zshrc
source ~/.bashrc
yes | yay -Syyuu
source ~/.zshrc
source ~/.bashrc