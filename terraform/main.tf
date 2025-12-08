terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

# Utilise une image déjà buildée
resource "docker_image" "app" {
  name = "test-image"
}

# Crée le conteneur à partir de l'image existante
resource "docker_container" "app_container" {
  name  = "demo-devops-container"
  image = docker_image.app.name

  ports {
    internal = 80
    external = 8080
  }
}
