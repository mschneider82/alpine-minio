#!/usr/bin/with-contenv sh

if [ ! -z $TLS_FQDN ] ;
then
    /usr/bin/generate_cert -days 3600 -host $TLS_FQDN -cert ${APP_HOME}/.minio/certs/public.crt -key ${APP_HOME}/.minio/certs/private.key
    chown ${USER}:${GROUP} ${APP_HOME}/.minio/certs/public.crt ${APP_HOME}/.minio/certs/private.key
fi
