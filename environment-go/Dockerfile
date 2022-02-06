## GOLANG
FROM golang:1.17 AS base

FROM base AS dev

## Variáveis 
ENV DEVELOPMENT_DIR=/usr/environment-go
ENV DEVELOPMENT_PORT=5000

## Baixa o hot reload
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

## diretorios de trabalho
WORKDIR ${DEVELOPMENT_DIR}

## Atualiza as dependências
COPY go.mod go.sum ./
RUN go mod download && go mod verify

## Copia projeto
COPY . .

RUN go build -v -o /usr/local/bin/app ./...

## porta de acesso
EXPOSE ${DEVELOPMENT_PORT}  

## diretorio padrao
VOLUME ${DEVELOPMENT_DIR}

CMD ["air"]