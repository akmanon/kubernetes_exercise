#!/bin/bash

#Generate Private Key using openssl
openssl genrsa -out app_user.key 2048

#Generate Certificate Signing Request using above private key
openssl req -new -key app_user.key -out app_user.csr -subj "/CN=appuser/O=sre/O=ops"


#Generate X509 Certificate usign CA cert and key by passing user csr
openssl x509 -req -in app_user.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out app_user.cert -days 730


#Verify the Cert
openssl x509 -in app_user.cert -text -noout