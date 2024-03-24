USER_NAME=appuser

#Get the Cluster Name
kubectl config get-clusters

#Creating the User in Kubernetes Cluster. 
#Note "@kuberntes" is the name the name of the cluster
kubectl config set-credentials $USER_NAME --client-certificate="$USER_NAME.cert" --client-key="$USER_NAME.key" --embed-certs=true

#kubectl config set-credentials appuser@kubernetes --client-certificate="app-user.cert" --client-key="app_user.key" --embed-certs=true

#Setting the Context
kubectl config set-context appuser --cluster=kubernetes  --user=$USER_NAME

#kubectl config set-context appuser@kubernetes --cluster=kubernetes  --user=appuser

#Confirm the context creation
kubectl config get-contexts

#Switching to appuser context
kubectl config use-context appuser

#To Generate the Kube config for the user
kubectl config view --minify --raw