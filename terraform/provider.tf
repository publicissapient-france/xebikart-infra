provider "google" {
  region  = "europe-west1"
  version = "~> 2.1"
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
