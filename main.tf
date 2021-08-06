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
  # Configuration options
}