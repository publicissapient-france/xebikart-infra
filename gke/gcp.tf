variable "project" {}
variable "region" {}
variable "clusterName" {}

provider "google" {
  project = "${var.project}"
  region = "${var.region}"
  credentials = "${file("credentials.json")}" // TODO: env variable
}

resource "google_container_cluster" "primary" {
  name = "${var.clusterName}"
  region = "${var.region}"

  master_auth {
    username = ""
    password = ""
  }
}

output "gke_endpoint" {
  value = "${google_container_cluster.primary.endpoint}"
}