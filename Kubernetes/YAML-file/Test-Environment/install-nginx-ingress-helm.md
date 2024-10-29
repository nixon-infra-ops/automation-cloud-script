# Create a namespace for your ingress resources
    kubectl create namespace ingress-deployment
    # Add the official stable repository
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo add  stable https://charts.helm.sh/stable   
    helm repo update

    #  Customizing the Chart Before Installing. 
    helm show values ingress-nginx/ingress-nginx


    helm install ingress-nginx ingress-nginx/ingress-nginx \
        --namespace development \
        --set controller.replicaCount=2 \
        --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
        --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux \
        --set controller.service.externalTrafficPolicy=Local \
        --set controller.service.loadBalancerIP="" 




        Webhook 

        kubectl get -A ValidatingWebhookConfiguration

        kubectl delete ValidatingWebhookConfiguration kii-nginx-ingress-nginx-admission project-nginx-ingress-nginx-admission

