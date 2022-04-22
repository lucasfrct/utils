#!/bin/bash +x

# instlando zsh
yay -S --noconfirm zsh
yay -S --noconfirm zsh-theme-powerlevel10k-git

grep -qxF 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' ~/.zshrc || echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

sudo chsh -s /usr/bin/zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc
source ~/.bashrc
yes | sudo pacman -Syyuu