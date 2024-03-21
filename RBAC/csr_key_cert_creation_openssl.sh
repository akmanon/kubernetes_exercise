#!/bin/bash

#Generate Private Key using openssl
openssl genrsa -out app_user.key 2048

#Generate Certificate Signing Request using above private key
openssl req -new -key app_user.key -out app_user.csr -subj "/CN=appuser/O=sre/O=ops"


#Generate X509 Certificate usign CA cert and key by passing user csr
openssl x509 -req -in app_user.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out app_user.cert -days 730


#Verify the Cert
openssl x509 -in app_user.cert -text -noout

#Get the Cluster Name
kubectl config get-clusters

#Creating the User in Kubernetes Cluster. 
#Note "@kuberntes" is the name the name of the cluster
kubectl config set-credentials appuser --client-certificate="app-user.cert" --client-key="app_user.key" --embed-certs=true

#kubectl config set-credentials appuser@kubernetes --client-certificate="app-user.cert" --client-key="app_user.key" --embed-certs=true

#Setting the Context
kubectl config set-context appuser --cluster=kubernetes  --user=appuser

#kubectl config set-context appuser@kubernetes --cluster=kubernetes  --user=appuser

#Confirm the context creation
kubectl config get-contexts

#Switching to appuser context
kubectl config use-context appuser

#To Generate the Kube config for the user
kubectl config view --minify --raw

