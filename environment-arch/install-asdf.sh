#!/bin/bash +x

## Versionador ASDF VM
yay -S --noconfirm asdf-vm
grep -qxF 'source /opt/asdf-vm/asdf.sh' ~/.zshrc || echo 'source /opt/asdf-vm/asdf.sh' >>~/.zshrc

## Atualiza YAY
asdf plugin add yay
asdf install yay latest

source ~/.zshrc