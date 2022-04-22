#!/bin/bash +x

## NODE JS
# EX: asdf local nodejs lts-gallium
# asdf list
asdf plugin add nodejs
asdf plugin add yarn
asdf install nodejs latest
asdf install nodejs lts-gallium
asdf install yarn latest
asdf global nodejs lts-gallium
asdf global yarn latest