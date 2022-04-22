#!/bin/bash +x

yay -S --noconfirm docker
yay -S --noconfirm docker-compose
yay -S --noconfirm docker-machine 0.16.2-5

sudo systemctl start docker
sudo systemctl start docker.service
sudo systemctl enable docker
sudo systemctl enable docker.service
sudo usermod -aG docker $USER