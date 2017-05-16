#!/bin/bash

# This file will export contain the 
# SERVER_URL
# USERNAME
# PASSWORD
source ~/.jenkins.creds

# if you don't want to use latest you will need to change the docker tag
docker run -ti --rm --env SERVER_URL=${SERVER_URL} -v `pwd`:/tmp jmaelstrom/jcli:latest $@ --username=${USERNAME} --password=${PASSWORD}
