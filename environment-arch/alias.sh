#!/bin/bash +x

grep -qxF '###### ALIAS DEVELOPMENT USE ######' ~/.zshrc || echo '
###### ALIAS DEVELOPMENT USE ######
' >>~/.zshrc
grep -qxF 'alias ll="ls -la"' ~/.zshrc || echo 'alias ll="ls -la"' >>~/.zshrc
source ~/.zshrc
grep -qxF 'alias repo="cd /mnt/d/Documents/github.com/"' ~/.zshrc || echo 'alias repo="cd /mnt/d/Documents/github.com/"' >>~/.zshrc
source ~/.zshrc

grep -qxF 'alias utils="cd repo; cd lucasfrct/utils"' ~/.zshrc || echo 'alias utils="cd repo; cd lucasfrct/utils/"' >>~/.zshrc
source ~/.zshrc

