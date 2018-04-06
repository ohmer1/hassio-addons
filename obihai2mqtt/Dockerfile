ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
RUN apk add --no-cache jq 
RUN apk add --no-cache git
RUN apk add --no-cache php5 php5-curl php5-openssl
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing composer

# Copy data for add-on
COPY run.sh /
RUN chmod +x /run.sh

RUN git clone --branch v1.0 https://github.com/ohmer1/obihai2mqtt.git /usr/local/obihai2mqtt/

CMD [ "/run.sh" ]
