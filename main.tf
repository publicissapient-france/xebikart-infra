provider "google" {
  project = "keynote-xebicon-19"
  region = "${var.region}"
  credentials = "${file("credentials.json")}"
}

resource "google_container_cluster" "primary" {
  name = "${var.cluster_name}"
  region = "${var.region}"
  initial_node_count = "${var.gcp_cluster_count}"
  remove_default_node_pool = true

  master_auth {
    username = ""
    password = ""
  }
}

// Resources CI
resource "google_container_node_pool" "ci_pool" {
  cluster = "${google_container_cluster.primary.name}"
  region = "${var.region}"
  node_count = "2"

  node_config {
    machine_type = "n1-standard-1"
  }
}
