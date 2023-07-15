# Deploy ToDo List App using simple-helm-chart with Terraform

# Configure the Helm provider

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # Path to your Kube config file
  }
}

# Deploy the Helm chart with values file

resource "helm_release" "helm_deploy_1" {
  name       = "todolist-app-1"
  repository = "https://dockerdevday2.github.io/helm-charts/"
  chart      = "simple-helm-chart"
  version    = "1.0.0" # Chart version
  namespace  = "default"
  atomic     = true
  values = [
    "${file("values.yaml")}"
  ]
}

# Deploy the Helm chart with setting individual values

resource "helm_release" "helm_deploy_2" {
  name       = "todolist-app-2"
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

# Deploy the Helm chart with values file, individual values and local chart

resource "helm_release" "helm_deploy_3" {
  name       = "todolist-app-3"
  chart      = "./helm-chart-source/simple-helm-chart"
  version    = "1.0.0" # Chart version
  namespace  = "default"
  atomic     = true
  values = [
    "${file("values.yaml")}"
  ]
  set {
    name  = "application.name"
    value = "todolist-3"
  }
}



# # Deploy fluent-bit using Helm
# resource "helm_release" "helm_chart_2" {
#   name       = "fluent-bit"
#   repository = "https://fluent.github.io/helm-charts"
#   chart      = "fluent-bit"
#   version    = "0.20.2"
#   namespace  = "default"
#   atomic     = true

# }

