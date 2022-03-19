# ! Derivando da imagem oficial do MySQL
FROM amazon/dynamodb-local:1.18.0 AS environment-dynamodb

# ! LAbels
LABEL org.label-schema.name="environment-dynamodb"
LABEL org.label-schema.name="environment-dynamodb"
LABEL description="environment-dynamodb"
LABEL org.opencontainers.image.name="environment-dynamodb"
LABEL org.opencontainers.image.authors="Lucas Costa"
LABEL org.opencontainers.image.hostname="environment-dynamodb"
LABEL com.docker.volume.name="environment-dynamodb"
LABEL com.docker.network.bridge.name="environment-dynamodb"

# ! Enviroment
ENV DYNAMODB_USER="development"

# ! Copy database persistent
COPY ./data /home/dynamodblocal/data

# ! PORT
EXPOSE 8000

CMD ["-jar DynamoDBLocal.jar -sharedDb -dbPath /home/dynamodblocal/data/"]