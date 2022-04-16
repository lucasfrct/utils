#!/bin/bash +x

yes | sudo pacman -Sy openssh
git config --global user.name "lucasfrct"
git config --global user.email "lucasfrct@gmail.com"
git config --global color.ui true
git config --global core.editor "code --wait"
git config --global merge.conflictstyle diff3
# ssh-keygen -t rsa -C "lucasfrct@gmail.com"
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com