#!/bin/sh

java -jar ~/dev/jenkins-cli.jar -s "${SERVER_URL}" $@ --username ${USERNAME} --password ${PASSWORD}
