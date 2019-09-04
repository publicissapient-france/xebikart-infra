provider "github" {
  organization = "xebia-france"
  version      = "2.0.0"
}

terraform {
  required_version = "~> 0.11"
  backend "gcs" {
    /*
    The configuration is done through partial configuration since backend
    configuration cannot contain variable interpolations and we need
    something that will depend on env
    */
    prefix = "repositories/state"
  }
}

