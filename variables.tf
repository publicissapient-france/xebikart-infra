variable "gcp_cluster_count" {
  type = "string"
  description = "Number of cluster instances"
}

variable "project_name" {
  type = "string"
  description = "Project name on GCP"
}

variable "cluster_name" {
  type = "string"
  description = "Cluster name"
}


variable "region" {
  type = "string"
  description = "Region where cluster will be deployed"
}