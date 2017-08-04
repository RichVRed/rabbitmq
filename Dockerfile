FROM        ubuntu:17.04
MAINTAINER  Robert Reiz <reiz@versioneye.com>

RUN apt-get install -y --force-yes -q wget; \
    echo 'deb http://www.rabbitmq.com/debian/ testing main' >> /etc/apt/sources.list; \
    wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc; \
    apt-key add rabbitmq-signing-key-public.asc; \
    apt-get update; \
    apt-get upgrade -y --force-yes; \
    apt-get install -y --force-yes -q rabbitmq-server

ADD rabbitmq.config /etc/rabbitmq/rabbitmq.config

CMD rabbitmq-server

EXPOSE 5672
