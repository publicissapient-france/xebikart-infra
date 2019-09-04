# CircleCI

resource "google_service_account" "circleci" {
  project      = "${google_project.xebikart.project_id}"
  account_id   = "xebikart-circleci"
  display_name = "XebiKart - CircleCI user"
}

resource "google_project_iam_member" "circleci-iam-gcr" {
  project = "${google_project.xebikart.project_id}"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.circleci.email}"
}

resource "google_project_iam_member" "circleci-iam-gke" {
  project = "${google_project.xebikart.project_id}"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.circleci.email}"
}

# Managed certificates
# https://github.com/GoogleCloudPlatform/gke-managed-certs/issues/14

resource "google_service_account" "managedcerts-controller-gke" {
  project      = "${google_project.xebikart.project_id}"
  account_id   = "xebikart-managedcerts-gke"
  display_name = "XebiKart - User for Managed Certificates controller on GKE"
}

resource "google_project_iam_custom_role" "certificates-management-role" {
  project      = "${google_project.xebikart.project_id}"
  role_id     = "certificatesAdmin"
  title       = "Certificates Management admin role"
  description = "Certificates Management admin role"
  permissions = [
    "compute.sslCertificates.create",
    "compute.sslCertificates.delete",
    "compute.sslCertificates.get",
    "compute.sslCertificates.list",
  ]
}

resource "google_project_iam_member" "managedcerts-iam-gke" {
  project = "${google_project.xebikart.project_id}"
  role    = "projects/${google_project.xebikart.project_id}/roles/${google_project_iam_custom_role.certificates-management-role.role_id}"
  member  = "serviceAccount:${google_service_account.managedcerts-controller-gke.email}"
}
