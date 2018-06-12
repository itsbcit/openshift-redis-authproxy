export STUNNEL_CONF="/etc/stunnel/stunnel.conf"
export STUNNEL_CONF_TEMPLATE="/etc/stunnel.conf.template"
export STUNNEL_DEBUG="${STUNNEL_DEBUG:-5}"
export STUNNEL_CAFILE="${STUNNEL_CAFILE:-/etc/ssl/certs/ca-certificates.crt}"
export STUNNEL_CONNECT="${STUNNEL_CONNECT:-redis.example.com:6379}"
export STUNNEL_VERIFY_CHAIN="${STUNNEL_VERIFY_CHAIN:-yes}"
export STUNNEL_CHECKHOST="${STUNNEL_CONNECT%:*}"

if [[ ! -s ${STUNNEL_CONF} ]]; then
    cat $STUNNEL_CONF_TEMPLATE | envsubst > ${STUNNEL_CONF}
fi
