#!/bin/bash +x

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