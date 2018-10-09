FROM alpine

MAINTAINER "dnknth"

RUN apk add --no-cache ca-certificates \
    inetutils-syslogd mailx postfix runit

COPY service /etc/service
COPY syslog.conf /etc/syslog.conf

STOPSIGNAL SIGKILL

EXPOSE 25

ENTRYPOINT ["/sbin/runsvdir", "/etc/service"]
