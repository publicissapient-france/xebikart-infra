# ARCHIVED - ML Infra
module "xebikart-ml-infra-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "ml-infra"
  repo_description = "TODO"
  repo_site_url    = "TODO"

  additional_topics = ["links"]
}

# ML Tubes
module "xebikart-ml-tubes-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "ml-tubes"
  repo_description = "repo for easy exchange of ML datasets "
  repo_site_url    = "TODO"

  additional_topics = ["links"]
}

