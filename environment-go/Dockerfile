
## GO lang com live-reload
FROM golang:1.18 AS environment-go

## Configurando variáveis de Ambiente
ENV PATH_PROJECT='/usr/local/github.com/lucasfrct/environment-go'
ENV TZ=America/Sao_Paulo
ENV GO111MODULE=on
ENV GOPRIVATE=*

## Labels
LABEL description="environment-go"
LABEL org.opencontainers.image.name="environment-go"
LABEL org.opencontainers.image.authors="IT Lean, Lucas Costa"
LABEL org.opencontainers.image.hostname="environment-go"
LABEL com.docker.volume.name='environment-go'
LABEL com.docker.network.bridge.name='environment-go'

## Atulaiza o continer
RUN apt -y update
RUN apt -y install build-essential wget git unzip gcc tzdata

## NEW TIMEZONE
RUN echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

## diretorio de trabalho
WORKDIR ${PATH_PROJECT}

## install gin live reload
RUN go install github.com/codegangsta/gin@latest

## copia o módulo
COPY go.mod .
COPY go.sum .

# ## Copia as dependencias
COPY ./vendor ./vendor

## instalando pacotes
RUN go mod download && go mod verify
RUN go mod vendor

COPY ./ ./

## altera permissoes de pastas e arquivos
RUN chmod -R +x *.go

## portas de acesso
EXPOSE 9000

## diretorio padrao
VOLUME ${PATH_PROJECT}

CMD ["gin", "-i", "run"]