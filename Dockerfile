FROM bcit/openshift-stunnel

ENV RUNUSER none

RUN apk add --no-cache \
        tini

# Add docker-entrypoint script base
ENV DE_VERSION v1.1
ADD https://github.com/itsbcit/docker-entrypoint/releases/download/${DE_VERSION}/docker-entrypoint.tar.gz /docker-entrypoint.tar.gz
RUN tar zxvf docker-entrypoint.tar.gz && rm -f docker-entrypoint.tar.gz
COPY 60-stunnel-config.sh /docker-entrypoint.d/60-stunnel-config.sh
RUN chmod -R 555 /docker-entrypoint.*

# Allow resolve-userid.sh script to run
RUN chmod 664 /etc/passwd /etc/group

COPY stunnel.conf.template /etc/stunnel.conf.template

ENV STUNNEL_CONNECT ""
ENV STUNNEL_PSK ""
EXPOSE 6379

ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]
CMD ["/usr/bin/stunnel"]
