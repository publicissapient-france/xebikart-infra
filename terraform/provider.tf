provider "google" {
  region  = "europe-west1"
  version = "2.5.1"
}

# We need both the `google` and `google-beta` providers to use beta features
# from GKE such as the Istio addon. See Terraform doc for more informations:
# https://www.terraform.io/docs/providers/google/provider_versions.html
provider "google-beta" {
  region  = "europe-west1"
  version = "2.5.1"
}

terraform {
  required_version = "~> 0.11"
  backend "gcs" {
    /*
    The configuration is done through partial configuration since backend
    configuration cannot contain variable interpolations and we need
    something that will depend on env
    */
  }
}
