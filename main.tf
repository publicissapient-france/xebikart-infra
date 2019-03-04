module "gke" {
  source = "./gke"
  project = "${var.project_name}"
  clusterName = "${var.cluster_name}"
  region = "${var.region}"
}

module "k8s" {
  source = "./k8s"

  endpoint = "${module.gke.endpoint}"
  access_token = "${module.gke.access_token}"

  cluster_ca_certificate = "${module.gke.cluster_ca_certificate}"
  client_key = "${module.gke.client_key}"
  client_certificate = "${module.gke.client_certificate}"
}
