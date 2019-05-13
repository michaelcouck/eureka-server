# Login to Azure and the image registry for the docker containers
az login -u michael.couck@gmail.com -p Caherl1ne2013
az configure --defaults acr=senpairegistry
az acr login -n senpairegistry
CLIENT_ID=$(az aks show -g senpai-kubernetes -n senpai-kubernetes-cluster --query "servicePrincipalProfile.clientId" --output tsv)
ACR_ID=$(az acr show -g senpai-kubernetes -n senpairegistry --query "id" --output tsv)
az role assignment create --assignee $CLIENT_ID --role acrpull --scope $ACR_ID

# Build the application and load the image up to the kubernetes image registry, ready for deployment
mvn compile jib:build

# Loads the image up to the registry
kubectl run eureka-server --image=senpairegistry.azurecr.io/eureka-server:latest

# Configure the freshly deployed pod/application/container
kubectl expose deployment eureka-server --type=LoadBalancer --port=80 --target-port=8888

# Print everything in the cluster
kubectl get all