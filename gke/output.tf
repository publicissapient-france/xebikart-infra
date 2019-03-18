
output "endpoint" {
  value = "${google_container_cluster.primary.endpoint}"
}

output "access_token" {
  value = "${data.google_client_config.current.access_token}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
  sensitive = true
}