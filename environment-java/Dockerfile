# java springboot com maven
FROM maven:3.6.3-openjdk-11 AS environment-java

## # descricao do container
LABEL description="environment-java"

## # diretorio de trabalho
WORKDIR /usr/environment-java

## # copia as dependencias
COPY pom.xml ./

## # instala os pacotes
RUN mvn package

## # copia o projeto
COPY src ./src/

## # coloca permissão de execusão
RUN chmod -R +x *.jar

## # diretorio padrao
VOLUME /usr/environment-java

## # expoe a porta para trabalho
EXPOSE 8080

## # executa o comando ao iniciar o cantainer
CMD [ "mvn", "spring-boot:run" ]
