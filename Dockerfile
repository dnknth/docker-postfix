FROM alpine

LABEL org.opencontainers.image.authors="dnknth"

RUN apk add --no-cache ca-certificates \
    inetutils-syslogd mailx postfix runit tzdata

COPY service /etc/service
COPY syslog.conf /etc/syslog.conf

VOLUME /etc/postfix
STOPSIGNAL SIGKILL
EXPOSE 25
ENTRYPOINT [ "/sbin/runsvdir", "/etc/service" ]
