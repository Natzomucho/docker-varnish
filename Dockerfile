FROM alpine:3.6

MAINTAINER Brian Winkers <bwinkers@gmail.com>

ENV VARNISH_BACKEND_PORT 80
ENV VARNISH_BACKEND_IP 127.0.0.1
ENV VARNISH_PORT 80

RUN apk add --update --no-cache varnish

ADD default.vcl /etc/varnish/default.vcl

ADD run.sh /usr/sbin/run.sh

RUN chmod +x /usr/sbin/run.sh

EXPOSE 80

CMD ["run.sh"]
