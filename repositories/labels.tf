module "xebikart-infra_labels_pr-lifecycle" {
  source     = "./modules/xebikart-github-labels/common/pr-lifecycle"
  repository = data.github_repository.xebikart-infra-repo.name
}

module "xebikart-infra_labels_closing-reason" {
  source     = "./modules/xebikart-github-labels/common/closing-reason"
  repository = data.github_repository.xebikart-infra-repo.name
}

