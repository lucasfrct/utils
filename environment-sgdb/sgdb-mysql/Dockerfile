# ! Derivando da imagem oficial do MySQL
FROM mysql:5.7 AS environment-mysql

# ! Labels
LABEL org.label-schema.name="environment-mysql"
LABEL description="environment-mysql"
LABEL org.opencontainers.image.name="environment-mysql"
LABEL org.opencontainers.image.authors="Lucas Costa"
LABEL org.opencontainers.image.hostname="environment-mysql"
LABEL com.docker.volume.name="environment-mysql"
LABEL com.docker.network.bridge.name="environment-mysql"

# ! Enviroment
ENV MYSQL_ALLOW_EMPTY_PASSWORD="yes"
ENV MYSQL_DATABASE="development"
ENV MYSQL_USER="development"
ENV MYSQL_ROOT_PASSWORD="Alterar123"
ENV MYSQL_PASSWORD="Alterar123"

# ! diretorios de trabalho
WORKDIR /var/lib/mysql

# ! PORT
EXPOSE 3306

CMD ["--default-authentication-plugin=mysql_native_password"]