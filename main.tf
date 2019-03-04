module "gke" {
  source = "./gke"
  project = "${var.project_name}"
  clusterName = "${var.cluster_name}"
  region = "${var.region}"
}

module "ci" {
  source = "./ci"
  gkeEndpoint = "${module.gke.gke_endpoint}"
}

module "leaderboard" {
  source = "./leaderboard"
}
