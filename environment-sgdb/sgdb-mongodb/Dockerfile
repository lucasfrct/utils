# ! Derivando da imagem oficial do MySQL
FROM mongo:5.0.6 AS environment-mongodb

# ! LAbels
LABEL org.label-schema.name="environment-mongodb"
LABEL org.label-schema.name="environment-mongodb"
LABEL description="environment-mongodb"
LABEL org.opencontainers.image.name="environment-mongodb"
LABEL org.opencontainers.image.authors="Lucas Costa"
LABEL org.opencontainers.image.hostname="environment-mongodb"
LABEL com.docker.volume.name="environment-mongodb"
LABEL com.docker.network.bridge.name="environment-mongodb"

# ! Enviroment
ENV MONGO_INITDB_ROOT_USERNAME="development"
ENV MONGO_INITDB_ROOT_PASSWORD="Alterar123"

# ! diretorios de trabalho
WORKDIR /data/db

# ! Copy database persistent
COPY ./data .

# ! PORT
EXPOSE 27017
