#!/bin/bash +x

yes | sudo pacman -Sy openssh
git config --global user.name "lucasfrct"
git config --global user.email "lucasfrct@gmail.com"
git config --global color.ui true
git config --global core.editor "code --wait"
git config --global merge.conflictstyle diff3
# ssh-keygen -t rsa -C "lucasfrct@gmail.com"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com
git remote -v
git remote set-url origin git@github.com:lucasfrct/{repository}.git