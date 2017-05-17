#!/bin/bash

# This script will make it much easier to use the Jenkins console to automate our
# various build tasks

if [[ ! -f ~/.jenkins.creds ]]; then
    echo "ERROR: You must set your USERNAME, PASSWORD, and SERVER_URL for Jenkins in ~/.jenkins.creds"
fi

# This file will contain the
# SERVER_URL
# USERNAME
# PASSWORD
source ~/.jenkins.creds

IMP=/tmp/scripts

#if this is a groovy command and it's not the stdin operator
#we will need to massage the script path to match the
#container volume mount
if [[ "${1}" == "groovy" ]] && [[ "${2}" != "=" ]]; then
    ABS_PATH=$(readlink -m "${2}")
    MP=$(dirname "${ABS_PATH}")

    #this sets all of the passed in arguments - changing the script
    #location provided so that it matches the volume mount internal
    #to the container
    set -- "${1}" "${IMP}/$(basename ${2})" "${@:3:$((${#@}))}"
else
    MP=$(pwd)
fi

# if you don't want to use latest you will need to change the docker tag
docker run -ti --rm --env SERVER_URL=${SERVER_URL} --env USERNAME=${USERNAME} --env PASSWORD=${PASSWORD} -v "${MP}":"${IMP}" jmaelstrom/jcli $@
