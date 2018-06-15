FROM bcit/openshift-stunnel

COPY stunnel.conf.template /etc/stunnel.conf.template
COPY 70-stunnel-psk.sh /docker-entrypoint.d/

ENV STUNNEL_CONNECT ""
ENV STUNNEL_PSK ""
EXPOSE 6379
