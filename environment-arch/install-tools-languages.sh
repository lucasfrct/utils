#!/bin/bash +x

## registrando uma versão para o projeto
## Ex: asdf local nodejs lts-gallium    // registra o lts par o projeto corrente
## Ex: asdf list
## Ex: asdf node list

## C/C++
asdf plugin add cmake
asdf install cmake latest
asdf global cmake latest

## RUST
asdf plugin add rust
asdf install rust latest
asdf global rust latest

## GO LANG
asdf plugin add golang
asdf install golang latest
asdf global golang latest

## PYTHON
asdf plugin add python
asdf install python latest
sudo pacman -S --noconfirm python-pip
asdf global python latest

## JAVA
asdf plugin add java
asdf plugin add maven
asdf plugin add spring-boot
asdf install java latest
asdf install maven latest
asdf install spring-boot latest
asdf global java latest
asdf global maven latest
asdf global spring-boot latest

## TERRAFORM
asdf plugin add terraform
asdf plugin add iam-policy-json-to-terraform
asdf plugin add terraform-docs
asdf install terraform latest
asdf install iam-policy-json-to-terraform latest
asdf install terraform-docs latest
asdf global terraform latest
asdf global iam-policy-json-to-terraform latest
asdf global terraform-docs latest

## AWS
asdf plugin add awscli
asdf plugin add aws-copilot
asdf plugin add aws-iam-authenticator
asdf plugin add saml2aws
asdf install awscli latest
asdf install aws-copilot latest
asdf install aws-iam-authenticator latest
asdf install saml2aws latest
asdf global awscli latest
asdf global ws-copilot latest
asdf global aws-iam-authenticator latest
asdf global saml2aws latest

## NODE JS
# EX: asdf local nodejs lts-gallium
# asdf list
asdf plugin add nodejs
asdf plugin add yarn
asdf install nodejs latest
asdf install nodejs lts-gallium
asdf install yarn latest
asdf global nodejs lts-gallium
asdf global yarn lts-gallium

## FLUTTER
asdf plugin add dart
asdf plugin add flutter
asdf install dart latest
asdf install flutter 
asdf global dart latest
asdf global lutter

## GIT/GITHUB
asdf plugin add git
asdf plugin add github-cli
asdf install git latest
asdf install github-cli latest
asdf global git latest
asdf global ithub-cli latest