FROM solr:8.7.0
USER root
RUN apt-get update && \
    apt-get -y install git
USER $SOLR_USER
COPY create.sh /docker-entrypoint-initdb.d/create.sh
