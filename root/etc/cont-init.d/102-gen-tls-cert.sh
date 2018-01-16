#!/usr/bin/with-contenv sh

if [ ! -z $TLS_FQDN ] ;
then
    mkdir -p ${APP_HOME}/.minio/certs/CAs
    cp -a /etc/ca/ca.crt ${APP_HOME}/.minio/certs/CAs
    MY_IP=$(ip route get 8.8.8.8 | awk '{print $7}')
    /usr/bin/generate_cert -ca /etc/ca/ca.crt -ca-key /etc/ca/ca.key -days 3600 -org "MinioServer" -host "${TLS_FQDN},${MY_IP}" -cert ${APP_HOME}/.minio/certs/public.crt -key ${APP_HOME}/.minio/certs/private.key
    chown ${USER}:${GROUP} ${APP_HOME}/.minio/certs/public.crt ${APP_HOME}/.minio/certs/private.key
fi
