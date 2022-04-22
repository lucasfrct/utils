#!/bin/bash +x

## GIT/GITHUB
asdf plugin add git
asdf plugin add github-cli
asdf install git latest
asdf install github-cli latest
asdf global git latest
asdf global github-cli latest