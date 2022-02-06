
## Node alpine
FROM node:alpine AS environment-development

## Variáveis 
ENV DEVELOPMENT_DIR=/usr/environment-development
ENV DEVELOPMENT_PORT=3000

## steps não cacheados
ARG CACHEBUST=3 
ARG CACHEBUST=4 

## diretorios de trabalho
WORKDIR ${DEVELOPMENT_DIR}

## Arquivos de iniciacao par ao node
COPY package*.json ./

## install dependences
RUN npm install

## Copia projeto
COPY . .

## porta de acesso
EXPOSE ${DEVELOPMENT_PORT}  

## diretorio padrao
VOLUME ${DEVELOPMENT_DIR}

## start do ambiente
CMD ["npm", "run", "development"]