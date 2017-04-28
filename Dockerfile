from openjdk:8u121-jdk-alpine
label maintainer "jmaelstrom@gmail.com"
label jenkins.cli.version="1.625.2"
env SERVER_URL=${SERVER_URL}
run mkdir /root/dev
workdir /root/dev
copy jenkins-cli.jar ./
copy runme.sh ./
run chmod +x ./runme.sh
entrypoint ["/root/dev/runme.sh"]
