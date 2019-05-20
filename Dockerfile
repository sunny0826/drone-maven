FROM maven:3.6.1-jdk-8-alpine

ENTRYPOINT mvn -s /usr/share/maven/ref/settings.xml