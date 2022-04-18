
## GO lang com live-reload
FROM cintosyntax/docker-golang-live-reloading AS environment-go

ENV PROJECT=github.com/environment-go

LABEL description="environment-go"

LABEL org.opencontainers.image.name="environment-go"
LABEL org.opencontainers.image.authors="lucasfrct@gmail.com"
LABEL org.opencontainers.image.hostname="environment-go"

LABEL com.docker.volume.name='environment-go'
LABEL com.docker.network.bridge.name='environment-go'

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
ENV PATH_PROJECT=${GOSRC}/${PROJECT}

## diretorios de trabalho
WORKDIR ${PATH_PROJECT}

RUN export GOPATH=${WORKSPACE_GO}
RUN export GOPRIVATE=${PROJECT}

## Copia projeto
COPY . .

## alterar permissóes par ao formato linux
RUN find . -type f -print0 | xargs -0 sed -i 's/\r$//'
RUN find . -type d -print0 | xargs -0 chmod 755  
RUN find . -type f -print0 | xargs -0 chmod 644
RUN chmod -R +x *.go

RUN go get -v -d 

EXPOSE 9000
EXPOSE 9001:3000

## diretorio padrao
VOLUME ${PATH_PROJECT}

CMD [ "gin", "-i", "run"]