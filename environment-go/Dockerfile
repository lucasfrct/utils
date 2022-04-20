
## GO lang com live-reload
FROM golang:1.18 AS environment-go

## nome do projecto/pacote
ENV PROJECT=github.com/environment-go

## Labels
LABEL description="environment-go"
LABEL org.opencontainers.image.name="environment-go"
LABEL org.opencontainers.image.authors="lucasfrct@gmail.com"
LABEL org.opencontainers.image.hostname="environment-go"
LABEL com.docker.volume.name='environment-go'
LABEL com.docker.network.bridge.name='environment-go'

## Atulaiza o continer
RUN apt -y update && apt -y upgrade
RUN apt -y install build-essential
RUN apt -y install git

## ativando o suporte a modulo
## configurando a workspace GO
ENV GO111MODULE=on
ENV GOPRIVATE=*
ENV WORKSPACE_GO=/usr/go
ENV PATH_PROJECT=${WORKSPACE_GO}/src/${PROJECT}

## Criando pastar para trabalho
RUN mkdir -p ${WORKSPACE_GO}
RUN mkdir -p ${WORKSPACE_GO}/bin
RUN mkdir -p ${WORKSPACE_GO}/src
RUN mkdir -p ${WORKSPACE_GO}/pkg

## diretorios de trabalho
WORKDIR ${PATH_PROJECT}

## copia o módulo
COPY go.mod .
COPY go.sum .

## Copia projeto
COPY . .

## instalando pacotes
RUN go mod download && go mod verify

##  ativando o suporte a modulo
RUN go get -v -d
RUN go mod tidy

## altera permissoes de pastas e arquivos
RUN chmod -R 777 /root
RUN chmod -R 777 ${PATH_PROJECT}
RUN find . -type f -print0 | xargs -0 sed -i 's/\r$//'
RUN find . -type d -print0 | xargs -0 chmod 755  
RUN find . -type f -print0 | xargs -0 chmod 644
RUN chmod -R +x *.go

## habilita o vendor
RUN go mod vendor
RUN go mod why
RUN go clean -modcache

## install gin live reload
RUN go install github.com/codegangsta/gin@latest

## portas de acesso
EXPOSE 9000
EXPOSE 9001:3000 

## diretorio padrao
VOLUME ${PATH_PROJECT}

CMD ["gin", "-i", "run"]