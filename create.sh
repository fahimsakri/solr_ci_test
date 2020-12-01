#!/bin/bash
#this script will checkout the code and check for the configs
set -e
echo " before running solr "
git clone $GIT_REPO_URL /tmp/repo
echo "checkecd out your repo"
cd /tmp/repo
git checkout $BRANCH

/opt/docker-solr/scripts/precreate-core $SOLR_CORE_1 $SOLR_COLLECTION_1_CONFIG_PATH
/opt/docker-solr/scripts/precreate-core $SOLR_CORE_2 $SOLR_COLLECTION_2_CONFIG_PATH
