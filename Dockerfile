FROM maven:3.6.1-jdk-8-alpine

LABEL maintainer="sunnydog0826@gmail.com"

ADD script.sh /bin/

RUN apk update \
    && apk add --no-cache musl-dev gcc g++ python3 python3-dev ca-certificates wget \
    && wget --quiet --output-document=/etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-java-openjfx/releases/download/8.151.12-r0/java-openjfx-8.151.12-r0.apk \
    && apk add --no-cache java-openjfx-8.151.12-r0.apk \
    && pip3 install -U pip \
    && chmod +x /bin/script.sh \
    && pip install shyaml

ENTRYPOINT /bin/script.sh