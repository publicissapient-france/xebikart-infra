# GKE Cluster version
data "google_container_engine_versions" "gke-version-euw1" {
  project = "${google_project.xebikart.project_id}"
  region        = "europe-west1"
}

# The main GKE cluster. This is essentially the main purpose of all of this
resource "google_container_cluster" "gke-cluster" {
  name   = "xebikart-gke-${var.environment}-1"
  region = "europe-west1"
  project = "${google_project.xebikart.project_id}"
  min_master_version = "1.12.7-gke.7"
  initial_node_count = 1


  node_config {
    oauth_scopes = [
      # Defaults
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
      # For External-DNS
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite"
    ]
  }

  # Wait for GKE API to be enabled before trying to create the cluster
  depends_on = [
    "google_project_services.project_services"
  ]
}
