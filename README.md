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

### Build docker image for ToDo List Application (practice at your own time)
```
git clone https://github.com/tusharnankani/ToDoList
cd ToDoList
cat <<EOT>> Dockerfile
FROM httpd:latest
COPY ./ /usr/local/apache2/htdocs/
EXPOSE 80
EOT
docker build -t <YOUR-DOCKERHUB-USERNAME>/todolist . ## replace <YOUR-DOCKERHUB-USERNAME> with your dockerhub username
docker login ## if you are not logged in
docker push <YOUR-DOCKERHUB-USERNAME>/todolist ## replace <YOUR-DOCKERHUB-USERNAME> with your dockerhub username
```