# Deploy ToDo List App using simple-helm-chart with Terraform

# Configure the Helm provider

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # Path to your Kube config file
  }
}

# Deploy the Helm chart with values file

resource "helm_release" "helm_deploy_with_values_file" {
  name       = "todolist-app-with-values-file"
  repository = "https://dockerdevday2.github.io/helm-charts/"
  chart      = "simple-helm-chart"
  version    = "1.0.0" # Chart version
  namespace  = "default"
  atomic     = true
  values = [
    "${file("todolist-values.yaml")}"
  ]
}

# Deploy the Helm chart with setting individual values

resource "helm_release" "helm_deploy_with_values" {
  name       = "todolist-app-with-setting-values"
  repository = "https://dockerdevday2.github.io/helm-charts/"
  chart      = "simple-helm-chart"
  version    = "1.0.0" # Chart version
  namespace  = "default"
  atomic     = true
  set {
    name  = "deployment.enabled"
    value = "true"
  }
  set {
    name  = "deployment.type"
    value = "server"
  }
  set {
    name  = "deployment.replicas"
    value = "1"
  }
  set {
    name  = "deployment.containerPort"
    value = "80"
  }
  set {
    name  = "application.name"
    value = "todolist-set-values"
  }
  set {
    name  = "image.repository"
    value = "varunelavia/todo-list"
  }
  set {
    name  = "image.tag"
    value = "v1"
  }
  set {
    name  = "image.pullPolicy"
    value = "Always"
  }
  set {
    name  = "service.type"
    value = "ClusterIP"
  }
  set {
    name  = "service.port"
    value = "80"
  }
  set {
    name  = "service.targetPort"
    value = "http"
  }
}