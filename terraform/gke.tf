resource "google_container_cluster" "gke-cluster" {
  name   = "xebikart-gke-1"
  region = "europe-west1"
  project = "horgix-xebikart-1"
  initial_node_count = 1
}