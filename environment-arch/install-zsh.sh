#!/bin/bash +x

# instlando zsh
yay -S --noconfirm zsh
yay -S --noconfirm zsh-theme-powerlevel10k-git

grep -qxF 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' ~/.zshrc || echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

sudo chsh -s /usr/bin/zsh
sudo chsh -s $(which zsh)
sudo chsh -s /bin/zsh $USER
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc
yes | sudo pacman -Syyuu