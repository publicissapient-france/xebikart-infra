resource "google_project" "xebikart" {
  name = "XebiKart - ${var.environment}"
  project_id = "xebikart-${var.environment}-1"
  folder_id  = "${local.xebikart_gcp_folder_id}"
  billing_account = "${local.xebia_billing_account_id}"

}

# Enable Services APIs on the project
resource "google_project_services" "project_services" {
  project = "${google_project.xebikart.project_id}"

  services = [
    "container.googleapis.com"
  ]
}
