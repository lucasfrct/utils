#!/bin/bash +x

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