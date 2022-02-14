# ! Derivando da imagem oficial do MySQL
FROM mysql:5.7 AS mysql

# ! LAbels
LABEL org.label-schema.name="environment-mysql"
LABEL org.label-schema.name="environment-mysql"

# ! Enviroment
ENV MYSQL_ALLOW_EMPTY_PASSWORD="yes"
ENV MYSQL_DATABASE="development"
ENV MYSQL_USER="development"
ENV MYSQL_ROOT_PASSWORD="Alterar123"
ENV MYSQL_PASSWORD="Alterar123"

# ! diretorios de trabalho
WORKDIR /var/lib/mysql

# ! Copy database persistent
COPY ./data .

# ! diretorio padrao
VOLUME ./data

# ! PORT
EXPOSE 3306

CMD ["--default-authentication-plugin=mysql_native_password"]