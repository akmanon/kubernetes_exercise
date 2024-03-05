#Let's First deploy simple Nignx Deplyment
kubectl apply -f ../ServiceImplementation/frontend_nginx.yaml

#To scale Pod Horizontally we can use below kubectl commands
#This will trigger kube-scheduler to apply changes in realtime
kubectl scale -f ../ServiceImplementation/frontend_nginx.yaml --replicas=5
#   or
kubectl scale deployment/frontend --replicas=5



#To scale Pod vertically we need to use kubectl patch

kubectl patch deployment frontend --patch '{"spec":{"template":{"spec":{"containers":[{"name":"frontend-nginx-app", "resources":{"requests":{"cpu":"300m"}, "limits":{"cpu":"300m"}}}]}}}}'

#or

kubectl patch deployment frontend --patch '
{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "frontend-nginx-app",
            "resources": {
              "requests": {
                "cpu": "300m"
              },
              "limits": {
                "cpu": "300m"
              }
            }
          }
        ]
      }
    }
  }
}'
