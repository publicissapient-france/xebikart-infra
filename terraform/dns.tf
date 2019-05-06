resource "google_dns_managed_zone" "xebikart-zone" {
  project = "${google_project.xebikart.project_id}"

  name = "xebikart-zone"
  dns_name = "xebik.art."
  description = "XebiKart DNS Zone"

  labels = {
    project = "xebikart"
  }
}
