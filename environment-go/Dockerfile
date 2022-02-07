
## GO lang com live-reload
FROM cintosyntax/docker-golang-live-reloading AS environment-go

## Variáveis 
ENV PATH_PROJECT=/go/src/github.com/environment-go
ENV DEVELOPMENT_PORT=5000


## diretorios de trabalho
WORKDIR ${PATH_PROJECT}

## Copia projeto
COPY . .

RUN go get -v -d

## porta de acesso
EXPOSE ${DEVELOPMENT_PORT}  

## diretorio padrao
VOLUME ${PATH_PROJECT}