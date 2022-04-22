#!/bin/bash +x

## FLUTTER
asdf plugin add dart
asdf plugin add flutter
asdf install dart latest
asdf install flutter 2.10.5-stable
asdf global dart latest
asdf global flutter 2.10.5-stable

export FLUTTER_ROOT="$(asdf where flutter)"