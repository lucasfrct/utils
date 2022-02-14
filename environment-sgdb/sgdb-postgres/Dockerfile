# ! Derivando da imagem oficial do POSTGRES
FROM postgres:9.6.24 AS postgres

# ! Labels
LABEL org.label-schema.name="environment-postgres"
LABEL org.label-schema.name="environment-postgres"

# ! Enviroment
ENV POSTGRES_DB="development"
ENV POSTGRES_USER="development"
ENV POSTGRES_PASSWORD="Alterar123"

# ! diretorios de trabalho
WORKDIR /var/lib/postgresql/data

# ! Copy database persistent
COPY ./data .

# ! diretorio padrao
VOLUME ./data

# ! PORT
EXPOSE 5432