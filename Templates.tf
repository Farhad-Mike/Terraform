# Simple docker container

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {     # Image configuration
  name         = "nginx"              # Image name
  keep_locally = false                # Safe the image locally for future use or not
}

resource "docker_container" "nginx" { # Run image with configuration
  image = docker_image.nginx.image_id 
  name  = "tutorial"                  # Set name for newly create container

  ports {
    internal = 80                     # Internal port for container
    external = 8000                   # External port for container
  }
}
