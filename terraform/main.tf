provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "user" {
  metadata {
    name = "user-deployment"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "user"
      }
    }

    template {
      metadata {
        labels = {
          app = "user"
        }
      }

      spec {
        container {
          image = "your-dockerhub-username/user-service:latest"
          name  = "user"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "user" {
  metadata {
    name = "user-service"
  }

  spec {
    selector = {
      app = "user"
    }

    port {
      port        = 3000
      target_port = 3000
    }
  }
}

# Repeat for product and order services
