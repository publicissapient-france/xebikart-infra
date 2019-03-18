locals {
  # XebiKart parent folder ID on GCP - See README for details
  xebikart_gcp_folder_id = 770972260944

  # Billing Account - Christophe H. card, namely "XFR Orga - CB Christophe"
  xebia_billing_account_id = "002C54-030B48-27C3F8"
}

# TODO - Document how to override this?
variable "environment" {
  type    = "string"
  default = "dev"
}
