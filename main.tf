terraform {
 required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.78.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
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
resource "random_string" "random_five" {
  length = 5
  number = false
}
resource "google_sql_database_instance" "db-grads-cloud-sql" {
  name             = "db-pair-coding-grads"
  database_version = "MYSQL_5_7"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }
}
resource "google_sql_database" "database" {
  count    = 29
  name     = "${random_string.random_five.result}-db-grads-group-${count.index}"
  instance = google_sql_database_instance.db-grads-cloud-sql.name
}
resource "google_sql_user" "users" {
  count = 29
  name     = "${random_string.random_five.result}-group-${count.index}"
  instance = google_sql_database_instance.db-grads-cloud-sql.name
  password = "${random_string.random_five.result}"
}
