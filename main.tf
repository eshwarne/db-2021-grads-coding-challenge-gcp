terraform {
 required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.78.0"
    }
  }
  backend "remote" {
    organization = "eshwarne"
    workspaces {
      name = "db-grads-codingchallenge"
    }
  }
}

provider "google" {
 project = var.project-id-grad-one
 credentials = var.grad-one-service-account
}

resource "google_compute_instance" "default" {
  name         = "eshwar-tf-test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    test = "true"
  }

}