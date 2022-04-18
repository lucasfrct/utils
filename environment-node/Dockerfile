
#!/usr/bin/env node
## Node alpine
FROM node:alpine AS environment-node

ENV npm_config_user=root

LABEL description="environment-node"

LABEL org.opencontainers.image.name="environment-node"
LABEL org.opencontainers.image.authors="lucasfrct@gmail.com"
LABEL org.opencontainers.image.hostname="environment-node"

LABEL com.docker.volume.name='environment-node'
LABEL com.docker.network.bridge.name='environment-node'

## diretorios de trabalho
WORKDIR /usr/environment-node

## Arquivos de iniciacao par ao node
COPY package*.json ./

## install dependences com permissoes root
RUN npm install node
RUN npm install -g nodemon
RUN npm install --force

## Copia projeto
COPY . .

## alterar permissóes par ao formato linux
RUN find . -type f -print0 | xargs -0 sed -i 's/\r$//'
RUN find . -type d -print0 | xargs -0 chmod 755  
RUN find . -type f -print0 | xargs -0 chmod 644
RUN chmod -R +x *.js
# RUN chmod -R +x *.ts


## porta de acesso
EXPOSE 3000 

## diretorio padrao
VOLUME /usr/environment-node

## start do ambiente
CMD ["npm", "run", "dev"]