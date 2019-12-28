#!/bin/bash
#this script will checkout the code and check for the configs
set -e
echo " before running solr " /
git clone $CI_REPOSITORY_URL /tmp/repo
echo "checkecd out your repo"
cd /tmp/repo
git checkout $CI_COMMIT_SHA

PROJECT_CONFIGDIR="/tmp/repo/$SOLR_CONFIG_DIR"
SOLR_CONFIG_DIR='/var/solr/data'
CONFIGS=$(ls $PROJECT_CONFIGDIR)
for CONFIG in $CONFIGS
do
  echo $CONFIG
  /opt/docker-solr/scripts/precreate-core $CONFIG
  cp -R $PROJECT_CONFIGDIR/$CONIFG/* $SOLR_CONFIG_DIR/$CONFIG/conf/
done
