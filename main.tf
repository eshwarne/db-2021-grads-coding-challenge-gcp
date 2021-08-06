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
variable "gcp_apis" {
 type = list(string)
 default=["serviceusage.googleapis.com","logging.googleapis.com", "sql-component.googleapis.com", "cloudresourcemanager.googleapis.com", "sqladmin.googleapis.com"]
}
provider "google" {
 project = var.project-id-grad-one
 credentials = var.grad-one-service-account
}
resource "random_string" "random_five" {
  count = 29
  length = 5
  number = false
}
resource "random_string" "random_seven" {
  count = 29
  length = 7
  number = false
}
resource "google_sql_database_instance" "db-grads-cloud-sql" {
  name             = "db-pair-coding-grads"
  database_version = "MYSQL_5_7"
  region           = "us-central1"
  settings {
    tier = "db-g1-small"
    availability_type = "REGIONAL"
   backup_configuration {
     enabled = true
     binary_log_enabled = true
     
   }
  }
}

resource "google_project_service" "project" {
  for_each = toset(var.gcp_apis)
  service = each.value  
}

resource "google_sql_database" "database" {
  count    = 29
  name     = "${random_string.random_five[count.index].result}-db-grads-group-${count.index + 1}"
  instance = google_sql_database_instance.db-grads-cloud-sql.name
}
resource "google_sql_user" "users" {
  count = 29
  name     = "${random_string.random_five[count.index].result}-group-${count.index + 1}"
  instance = google_sql_database_instance.db-grads-cloud-sql.name
  password = "${random_string.random_seven[count.index].result}"
}

