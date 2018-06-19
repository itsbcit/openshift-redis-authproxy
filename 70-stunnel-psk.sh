export STUNNEL_PSK_FILE="${STUNNEL_PSK_FILE:-/etc/stunnel/psk.txt}"
export STUNNEL_VERIFY_CHAIN="${STUNNEL_VERIFY_CHAIN:-yes}"
export STUNNEL_CHECKHOST=$(echo $STUNNEL_CONNECT|cut -f1 -d ':')

if [[ -z "${STUNNEL_CONNECT}" ]] || [[ -z "${STUNNEL_PSK}" ]];then
    echo >&2 "missing STUNNEL_CONNECT and/or STUNNEL_PSK"
    exit 1
fi

if [[ ! -s ${STUNNEL_CONF} ]]; then
    cat ${STUNNEL_CONF_TEMPLATE} | envsubst > ${STUNNEL_CONF}
fi

echo ${STUNNEL_PSK} > ${STUNNEL_PSK_FILE}
