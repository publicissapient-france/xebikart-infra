# Google Project under which resources (like the GKE cluster) will be created
resource "google_project" "xebikart" {
  name = "XebiKart - ${var.environment}"
  project_id = "xebikart-${var.environment}-1"
  folder_id  = "${local.xebikart_gcp_folder_id}"
  billing_account = "${local.xebia_billing_account_id}"

}

# Enable Services APIs on the project
# We need container.googleapis.com to be enabled in order to use GKE
resource "google_project_services" "project_services" {
  project = "${google_project.xebikart.project_id}"

  services = [
    "container.googleapis.com",
    "dns.googleapis.com",
    # Compute and OSLogin are needed for GKE
    "compute.googleapis.com",
    "oslogin.googleapis.com",
    # Stackdriver
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "stackdriver.googleapis.com",
    # Enable by whatever is running on the GKE cluster
    "iam.googleapis.com",
    "bigquery-json.googleapis.com",
    "containerregistry.googleapis.com",
    "pubsub.googleapis.com",
    "iamcredentials.googleapis.com",
    "storage-api.googleapis.com",
  ]
}
