#!/bin/bash +x

source add-user-sudo.sh
source init-archlinux.sh
source install-yay.sh
source install-zsh.sh
source intall-asdf.sh
source install-tools.sh
source alias.sh

yay -S --noconfirm docker
yay -S --noconfirm chromium
yay -S --noconfirm google-chrome

