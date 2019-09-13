if [[ -z "${STUNNEL_CONNECT}" ]] || [[ -z "${STUNNEL_PSK}" ]];then
    echo >&2 "missing STUNNEL_CONNECT and/or STUNNEL_PSK"
    exit 1
fi

cat ${STUNNEL_CONF_TEMPLATE} | envsubst > ${STUNNEL_CONF}

echo ${STUNNEL_PSK} > ${STUNNEL_PSK_FILE}
