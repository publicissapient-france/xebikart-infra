output "GKE Cluster name" {
  value = "${google_container_cluster.gke-cluster.name}"
}

output "GKE Cluster region" {
  value = "${google_container_cluster.gke-cluster.region}"
}

output "gcloud command to get GKE credentials" {
  value = "gcloud container clusters get-credentials ${google_container_cluster.gke-cluster.name} --region ${google_container_cluster.gke-cluster.region}"
}

output "DNS NameServers for the xebik.art zone" {
  value = "${google_dns_managed_zone.xebikart-zone.name_servers}"
}

output "GKE latest version - master" {
  value = "${data.google_container_engine_versions.gke-version-euw1.latest_master_version}"
}

output "GKE latest version - nodes" {
  value = "${data.google_container_engine_versions.gke-version-euw1.latest_node_version}"
}
