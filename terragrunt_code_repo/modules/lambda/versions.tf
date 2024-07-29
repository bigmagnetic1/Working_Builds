terraform {
    required_version = ">= 0.13/1"

    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = "3.0.2"
        }
    }
}

provider "docker" {
    alias = "local"
    host  = "unix.//var/run/docker.sock"
}