
output "endpoint" {
  value = "${google_container_cluster.primary.endpoint}"
}

output "access_token" {
  value = "${data.google_client_config.current.access_token}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.cluster_ca_certificate}"
  sensitive = true
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.client_key}"
  sensitive = true
}

output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.client_certificate}"
  sensitive = true
}