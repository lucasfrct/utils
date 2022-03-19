# ! Derivando da imagem oficial do POSTGRES
FROM postgres:9.6.24 AS environment-postgres

# ! Labels
LABEL org.label-schema.name="environment-postgres"
LABEL org.label-schema.name="environment-postgres"
LABEL description="environment-postgres"
LABEL org.opencontainers.image.name="environment-postgres"
LABEL org.opencontainers.image.authors="Lucas Costa"
LABEL org.opencontainers.image.hostname="environment-postgres"
LABEL com.docker.volume.name="environment-postgres"
LABEL com.docker.network.bridge.name="environment-postgres"

# ! Enviroment
ENV POSTGRES_DB="development"
ENV POSTGRES_USER="development"
ENV POSTGRES_PASSWORD="Alterar123"

# ! diretorios de trabalho
WORKDIR /var/lib/postgresql/data

# ! Copy database persistent
COPY ./data .

# ! PORT
EXPOSE 5432