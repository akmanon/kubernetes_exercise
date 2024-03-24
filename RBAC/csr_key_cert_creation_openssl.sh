#!/bin/bash

USER_NAME=appuser
GROUP_NAME="O=sre/O=ops"
EXPIRY_DAYS=730

#Generate Private Key using openssl
openssl genrsa -out $USER_NAME.key 2048

#Generate Certificate Signing Request using above private key
openssl req -new -key $USER_NAME.key -out $USER_NAME.csr -subj "/CN=$USER_NAME/$GROUP_NAME"

#Generate X509 Certificate usign CA cert and key by passing user csr
openssl x509 -req -in $USER_NAME.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out $USER_NAME.cert -days $EXPIRY_DAYS

#Verify the Cert
openssl x509 -in $USER_NAME.cert -text -noout