# dockerdevday2.0

## Deploying Helm Chart using Terraform

### Prerequisites
- Git
- Docker
- Minikube
- Helm
- Terraform


### How to install ...?
- Git : https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- Docker : https://docs.docker.com/engine/install/
- Minikube : https://minikube.sigs.k8s.io/docs/start/
- Helm : https://helm.sh/docs/intro/install/
- Terraform : https://developer.hashicorp.com/terraform/downloads

### Demo Application
For the demo, we will use an open-source simple ToDo List app which is available on GitHub,
- URL : https://github.com/tusharnankani/ToDoList
- [Credits](credits.md) to the owner : tusharnankani

### Build and run docker image for ToDo List Application (practice at your own time)
```
git clone https://github.com/tusharnankani/ToDoList
cd ToDoList
cat <<EOT>> Dockerfile
FROM httpd:latest
COPY ./ /usr/local/apache2/htdocs/
EXPOSE 80
EOT
docker build -t todolist .
docker run -d --name todolist -p 80:80 todolist
```

### Push docker image to Docker Hub (practice at your own time)
```
docker login
docker tag todolist <your-dockerhub-username>/todolist
docker push <your-dockerhub-username>/todolist
```

### Start Minikube
```
minikube start
```

### Clone this repository
```
git clone https://github.com/dockerdevday2/dockerdevday2.github.io.git
cd dockerdevday2.github.io
```

### Get list of all available helm repositories
```
helm repo list
```

### Add helm repository
```
helm repo add dockerdevday2 https://dockerdevday2.github.io/helm-charts/
```

### Check if helm repository is added and charts are available
```
helm repo list
helm search repo dockerdevday2
```

### Manually install helm chart
```
helm install todolist dockerdevday2/simple-helm-chart -f values.yaml
```

### Check if helm chart is installed
```
helm list
```

### Port forward to access the application
```
kubectl port-forward svc/todolist 8080:80
```

### Access the application
```
http://localhost:8080
```

### Uninstall helm chart
```
helm uninstall todolist
```

### Deploy helm chart using Terraform
```
terraform init
terraform plan
terraform apply
```

### Check if helm chart is installed
```
helm list
```

### Port forward to access the application
```
kubectl port-forward svc/todolist 8080:80
kubectl port-forward svc/todolist-set-values 8081:80
```

### Access the application
```
http://localhost:8080
```

### Uninstall helm chart / cleanup
```
terraform destroy
```