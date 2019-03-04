variable "endpoint" {}
variable "access_token" {}
variable "cluster_ca_certificate" {}
variable "client_key" {}
variable "client_certificate" {}

provider "kubernetes" {
  host = "${var.endpoint}"
  token = "${var.access_token}"

  cluster_ca_certificate = "${base64decode(var.cluster_ca_certificate)}"
//  client_key = "${base64decode(var.client_key)}"
//  client_certificate = "${base64decode(var.client_certificate)}"
}

//module "ci" {
//  source = "./ci"
//}

module "leaderboard" {
  source = "./leaderboard"
}