#!/bin/bash +x

## removem  fim de linha do windows 
# sed -i 's/\r$//' .clean-intall

## habiliatando sudo
# echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

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
sudo pacman -S --noconfirm  base-devel
sudo pacman -S --noconfirm curl
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm git

## install yay
cd /tmp
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chmod 777 -R ./yay-git
cd yay-git
makepkg -si
sudo yay -Syu
yay -Syu --noconfirm  --devel --timeupdate
sudo yay -S --noconfirm  gparted
sudo yay -Yc

# instlando zsh
yay -S --noconfirm zsh
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
sudo chsh -s /usr/bin/zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# echo '' >>~/.zshrc
# echo '## ALIAS CUSTOM ## ' >>~/.zshrc
# echo 'alias ll=ls -la' >>~/.zshrc
source ~/.zshrc

## Versionador
yay -S --noconfirm asdf-vm
echo 'source /opt/asdf-vm/asdf.sh' >>~/.zshrc
source ~/.zshrc

## YAY
asdf plugin add yay
asdf install yay latest

## C/C++
asdf plugin add cmake
asdf install cmake latest

## RUST
asdf plugin add rust
asdf install rust latest

## GIT/GITHUB
asdf plugin add git
asdf install git latest
asdf plugin add github-cli
asdf install github-cli latest

## GITHUB COnfigure
git config --global user.name "lucasfrct"
git config --global user.email "lucasfrct@gmail.com"
git config --global color.ui true
git config --global core.editor "code --wait"
git config --global merge.conflictstyle diff3
ssh-keygen -t rsa -C "lucasfrct@gmail.com"

## GO LANG
asdf plugin add golang
asdf install golang latest

## JAVA
asdf plugin add java
asdf install java latest
asdf plugin add maven
asdf install maven latest
asdf plugin add spring-boot
asdf install spring-boot latest

## NODE JS
### decalar local para cada projeto
# asdf local nodejs lts-gallium
# asdf list
asdf plugin add nodejs
asdf install nodejs latest
asdf install nodejs lts-gallium
asdf global nodejs lts-gallium
asdf plugin add yarn
asdf install yarn latest

## PYTHON
asdf plugin add python
asdf install python latest

## TERRAFORM
asdf plugin add terraform
asdf install terraform latest
asdf plugin add iam-policy-json-to-terraform
asdf install iam-policy-json-to-terraform latest
asdf plugin add terraform-docs
asdf install terraform-docs latest

## AWS
asdf plugin add awscli
asdf install awscli latest
asdf plugin add aws-copilot
asdf install aws-copilot latest
asdf plugin add aws-iam-authenticator
asdf install aws-iam-authenticator latest
asdf plugin add saml2aws
asdf install saml2aws latest

## FLUTTER
asdf plugin add dart
asdf install dart latest
asdf plugin add flutter
asdf install flutter latest

yay -S --noconfirm docker
yay -S --noconfirm chromium

# sudo pacman -S --noconfirm npm
# sudo pacman -S --noconfirm yarn
# sudo pacman -S --noconfirm nodejs
# sudo pacman -S --noconfirm  rust
# sudo pacman -S --noconfirm  python-neovim
# yes | bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
# sudo pacman -S --noconfirm neovi