resource "google_container_cluster" "gke-cluster" {
  name   = "xebikart-gke-${var.environment}-1"
  region = "europe-west1"
  project = "${google_project.xebikart.project_id}"
  initial_node_count = 1

  # Wait for GKE API to be enabled before trying to create the cluster
  depends_on = [
    "google_project_services.project_services"
  ]
}
