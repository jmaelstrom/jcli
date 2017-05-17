FROM openjdk:8u121-jdk-alpine
LABEL maintainer "jmaelstrom@gmail.com"
LABEL jenkins.cli.version="1.625.2"
ENV SERVER_URL=${SERVER_URL}
ENV JAVA_OPTS=-XX:-UsePerfData
RUN mkdir /root/dev
WORKDIR /root/dev
COPY jenkins-cli-1.625.2.jar ./jenkins-cli.jar
COPY exec-jcli.sh ./
RUN chmod +x ./exec-jcli.sh
ENTRYPOINT ["/root/dev/exec-jcli.sh"]
