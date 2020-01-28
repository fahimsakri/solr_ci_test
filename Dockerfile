FROM solr:8.1.1
USER root
RUN apt-get update && \
    apt-get -y install git
USER $SOLR_USER
COPY create.sh /docker-entrypoint-initdb.d/create.sh

