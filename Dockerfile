FROM bcit/openshift-stunnel

COPY stunnel.conf.template /etc/stunnel/stunnel.conf.template
COPY 70-stunnel-psk.sh /docker-entrypoint.d/

ENV STUNNEL_ACCEPT 0.0.0.0:6379
ENV STUNNEL_DEBUG 5
ENV STUNNEL_SERVICE redis
ENV STUNNEL_CONNECT ""
ENV STUNNEL_PSK ""
ENV STUNNEL_PSK_FILE /etc/stunnel/psk.txt
EXPOSE 6379
