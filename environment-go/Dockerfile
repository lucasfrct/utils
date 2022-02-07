
## GO lang com live-reload
FROM cintosyntax/docker-golang-live-reloading AS environment-go

ENV PROJECT=github.com/environment-go

# montando WORSKSPACE
ENV WORKSPACE_GO=/go
ENV GOBIN=${WORKSPACE_GO}/bin
ENV GOPKG=${WORKSPACE_GO}/pkg
ENV GOSRC=${WORKSPACE_GO}/src

RUN mkdir -p ${WORKSPACE_GO}
RUN mkdir -p ${GOBIN}
RUN mkdir -p ${GOPKG}
RUN mkdir -p ${GOSRC}

## Variáveis 
ENV PATH_PROJECT=${GOSRC}/${PROJECT}}

## diretorios de trabalho
WORKDIR ${PATH_PROJECT}

RUN export GOPATH=${WORKSPACE_GO}
RUN export GOPRIVATE=${PROJECT}

## Copia projeto
COPY . .

RUN go get -v -d 
# RUN gin -i run

## diretorio padrao
VOLUME ${PATH_PROJECT}

# CMD [ "gin", "-i", "run"]