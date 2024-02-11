#Apply the Deployment with 4 replica pods
kubectl apply -f ./frontend_dev.yml

#Updating the image of the deployment
kubectl set image deployment/frontend frontend=httpd:alpine

#Check status of the deployment update
kubectl rollout status deployment/frontend

#Check the history for the deployment
kubectl rollout history deployment/frontend

#To Pause or resume the deployment
kubectl rollout pause deployment/frontend
kubectl rollout resume deployment/frontend

#To rollback the deployment
kubectl rollout undo deployment/frontend

#To rollback the deployment to the certain revision which was previousy deployed
kubectl rollout undo deployment/frontend --to-revision=3