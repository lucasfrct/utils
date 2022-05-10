#!/bin/bash +x

## para todos os cotainers
# sudo docker kill $(docker ps -q)

# ## remove todos os containers orphans
sudo docker-compose down --remove-orphans

# ## deleta todos os containers
sudo docker rm $(docker ps -a -q)
sudo docker container prune -f

# ## deleta todos os volumes
sudo docker volume prune -f

# ## delete todas as redes
sudo docker network prune -f

# ## deleta rodas a imagens
sudo docker rmi $(docker images -q)
sudo docker image prune -f
sudo docker image prune -a -f

# ## Limpa todos os sistemas do docker
sudo docker system prune -f