# ARCHIVED - ML Infra
module "xebikart-ml-infra-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "ml-infra"
  repo_description = "Infrastructure support for ML"
  repo_site_url    = "TODO"
  # TODO archived

  additional_topics = ["ml", "infra"]
}

# ML Tubes
module "xebikart-ml-tubes-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "ml-tubes"
  repo_description = "Repo to easily share ML datasets"
  repo_site_url    = "TODO"

  additional_topics = ["ml", "datasets", "sharing"]
}

