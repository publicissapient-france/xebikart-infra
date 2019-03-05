variable "project" {}
variable "region" {}
variable "clusterName" {}

provider "google" {
  project = "${var.project}"
  region = "${var.region}"
}

data "google_client_config" "current" {}

resource "google_container_cluster" "primary" {
  name = "${var.clusterName}"
  region = "${var.region}"
  initial_node_count = 1

  // No BASIC-AUTH
  master_auth {
    username = ""
    password = ""
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    tags = ["${var.clusterName}-cluster", "nodes"]
  }
}

