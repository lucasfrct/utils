# ! Derivando da imagem oficial do MySQL
FROM elasticsearch:7.17.0 AS environment-elasticsearch

# ! LAbels
LABEL org.label-schema.name="environment-elasticsearch"
LABEL org.label-schema.name="environment-elasticsearch"
LABEL description="environment-elasticsearch"
LABEL org.opencontainers.image.name="environment-elasticsearch"
LABEL org.opencontainers.image.authors="Lucas Costa"
LABEL org.opencontainers.image.hostname="environment-elasticsearch"
LABEL com.docker.volume.name="environment-elasticsearch"
LABEL com.docker.network.bridge.name="environment-elasticsearch"

# ! Enviroment
ENV node.name="environment-es01"
ENV cluster.name="evironment-es"
ENV cluster.initial_master_nodes="environment-es01"
ENV bootstrap.memory_lock="true"
ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"

# ! diretorios de trabalho
WORKDIR /usr/share/elasticsearch/data

# ! Copy database persistent
COPY ./data .

# ! PORT
EXPOSE 9200