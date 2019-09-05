FROM maven:3.6.1-jdk-8-alpine

LABEL maintainer="sunnydog0826@gmail.com"

ADD script.sh /bin/

RUN apk update \
    && apk add --no-cache musl-dev gcc g++ python3 python3-dev \
    && pip3 install -U pip \
    && chmod +x /bin/script.sh \
    && pip install shyaml

ENTRYPOINT /bin/script.sh