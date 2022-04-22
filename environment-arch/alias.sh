#!/bin/bash +x

grep -qxF '###### ALIAS DEVELOPMENT USE ######' ~/.zshrc || echo '
###### ALIAS DEVELOPMENT USE ######
' >>~/.zshrc
grep -qxF '###### ALIAS DEVELOPMENT USE ######' ~/.bashrc || echo '
###### ALIAS DEVELOPMENT USE ######
' >>~/.bashrc

grep -qxF 'alias ll="ls -la"' ~/.zshrc || echo 'alias ll="ls -la"' >>~/.zshrc
grep -qxF 'alias ll="ls -la"' ~/.bashrc || echo 'alias ll="ls -la"' >>~/.bashrc

grep -qxF 'alias repo="cd /mnt/d/Documents/github.com/"' ~/.zshrc || echo 'alias repo="cd /mnt/d/Documents/github.com/"' >>~/.zshrc
grep -qxF 'alias repo="cd /mnt/d/Documents/github.com/"' ~/.bashrc || echo 'alias repo="cd /mnt/d/Documents/github.com/"' >>~/.bashrc

grep -qxF 'alias utils="cd repo; cd lucasfrct/utils"' ~/.zshrc || echo 'alias utils="cd repo; cd lucasfrct/utils/"' >>~/.zshrc
grep -qxF 'alias utils="cd repo; cd lucasfrct/utils"' ~/.bashrc || echo 'alias utils="cd repo; cd lucasfrct/utils/"' >>~/.bashrc

source ~/.zshrc
source ~/.bashrc


