# GKE Cluster version
data "google_container_engine_versions" "gke-version-euw1" {
  project = "${google_project.xebikart.project_id}"
  location = "europe-west1"
}

# The main GKE cluster. This is essentially the main purpose of all of this
resource "google_container_cluster" "gke-cluster" {
  name   = "xebikart-gke-${var.environment}-1"
  location = "europe-west1"
  project = "${google_project.xebikart.project_id}"

  min_master_version = "1.12.7-gke.7"

  remove_default_node_pool = true
  initial_node_count = 1

  monitoring_service = "monitoring.googleapis.com/kubernetes"
  logging_service = "logging.googleapis.com/kubernetes"

  addons_config {
    kubernetes_dashboard {
      disabled = false
    }
  }

  # Wait for GKE API to be enabled before trying to create the cluster
  depends_on = [
    "google_project_services.project_services"
  ]
}

resource "google_container_node_pool" "main-nodes" {
  name       = "main-node-pool"
  location   = "europe-west1"
  project = "${google_project.xebikart.project_id}"

  cluster    = "${google_container_cluster.gke-cluster.name}"
  initial_node_count = 1

  management {
    auto_repair = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  node_config {
    #preemptible  = true
    machine_type = "n1-standard-1"

    #metadata = {
    #  disable-legacy-endpoints = "true"
    #}

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
}

