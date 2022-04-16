# ! Derivando da imagem oficial do MySQL
FROM redis:7.0-rc1-alpine3.15 AS environment-redis

# ! LAbels
LABEL org.label-schema.name="environment-redis"
LABEL org.label-schema.name="environment-redis"
LABEL description="environment-redis"
LABEL org.opencontainers.image.name="environment-redis"
LABEL org.opencontainers.image.authors="Lucas Costa"
LABEL org.opencontainers.image.hostname="environment-redis"
LABEL com.docker.volume.name="environment-redis"
LABEL com.docker.network.bridge.name="environment-redis"

# ! Enviroment
ENV REDIS_PASSWORD="Alterar123"

# ! diretorios de trabalho
WORKDIR /data

# ! Copy database persistent
COPY ./data .

# ! PORT
EXPOSE 6379

CMD ["redis-server --save 20 1 --loglevel warning --requirepass Alterar123"]