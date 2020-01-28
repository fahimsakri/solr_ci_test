#!/bin/bash
#this script will checkout the code and check for the configs
set -e
echo " before running solr "
git clone $CI_REPOSITORY_URL /tmp/repo
echo "checkecd out your repo"
cd /tmp/repo
git checkout $CI_COMMIT_SHA
cp -rvf /tmp/repo/cluster_bootstrap/files/orbis_item/* /tmp/repo/deployment/ansible/files/solr_configs/orbis_item

/opt/docker-solr/scripts/precreate-core orbis_item /tmp/repo/deployment/ansible/files/solr_configs/orbis_item/
/opt/docker-solr/scripts/precreate-core orbis_autocomplete /tmp/repo/deployment/ansible/files/solr_configs/orbis_autocomplete/
