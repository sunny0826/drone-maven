FROM maven:3.6.1-jdk-8-alpine

ENTRYPOINT mvn install --settings /usr/share/maven/ref/settings.xml