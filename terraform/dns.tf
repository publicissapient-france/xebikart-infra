resource "google_dns_managed_zone" "xebikart-zone" {
  project = "${google_project.xebikart.project_id}"

  name = "xebikart-zone"
  dns_name = "xebik.art."
  description = "XebiKart DNS Zone"

  # Empty `visibility` is necessary in order to avoid unecessary diff.
  # This is a bug since Terraform's GCP provider version 2.4 that has not been
  # solved yet
  # CHANGELOG mentionning it: https://github.com/terraform-providers/terraform-provider-google/blob/master/CHANGELOG.md#240-april-15-2019
  # Issue about it: https://github.com/terraform-providers/terraform-provider-google/issues/3435
  visibility = ""

  labels = {
    project = "xebikart"
  }
}
