#Create Pod in Imperative Ways
kubectl run myapp --image=nginx --restart=never

#Get Pods Details
kubectl get pods -o wide

#Get More Info about the Pods
kubectl describe pods myapp

#Get logs of the First Pod and to get live logs add "-f" param
kubectl logs myapp

#To run Command in Pod and to enter into pod user -it with -- bash in the end
kubectl exec myapp -- "ls; hostname;"

#TO delete Pod 
kubectl delete pods myapp
kubectl get pods -o wide

