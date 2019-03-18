output "GKE Cluster name" {
  value = "${google_container_cluster.gke-cluster.name}"
}

output "GKE Cluster region" {
  value = "${google_container_cluster.gke-cluster.region}"
}

output "gcloud command to get GKE credentials" {
  value = "gcloud container clusters get-credentials ${google_container_cluster.gke-cluster.name} --region ${google_container_cluster.gke-cluster.region}"
}
