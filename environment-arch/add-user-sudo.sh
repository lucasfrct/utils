#!/bin/bash +x

## habiliatando sudo
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

## adicioanando novo usuario
useradd -m -G wheel -s /bin/bash development
passwd -d development
whoami