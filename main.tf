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
    value = var.deployment_enabled
  }
  set {
    name  = "deployment.type"
    value = var.deployment_type
  }
  set {
    name  = "deployment.replicas"
    value = var.deployment_replicas
  }
  set {
    name  = "deployment.containerPort"
    value = var.deployment_containerPort
  }
  set {
    name  = "application.name"
    value = var.application_name
  }
  set {
    name  = "image.repository"
    value = var.image_repository
  }
  set {
    name  = "image.tag"
    value = var.image_tag
  }
  set {
    name  = "image.pullPolicy"
    value = var.image_pullPolicy
  }
  set {
    name  = "service.type"
    value = var.service_type
  }
  set {
    name  = "service.port"
    value = var.service_port
  }
  set {
    name  = "service.targetPort"
    value = var.service_targetPort
  }
}