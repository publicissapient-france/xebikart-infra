module "xebikart-infra_labels_pr-lifecycle" {
  source = "./labels-modules/common/pr-lifecycle"
  repository = "${data.github_repository.xebikart-infra-repo.name}"
}

module "xebikart-infra_labels_closing-reason" {
  source = "./labels-modules/common/closing-reason"
  repository = "${data.github_repository.xebikart-infra-repo.name}"
}
