#!/bin/bash +x

## PYTHON
asdf plugin add python
asdf install python latest
sudo pacman -S --noconfirm python-pip
asdf global python latest