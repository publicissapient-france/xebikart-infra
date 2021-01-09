# ARCHIVED - ML Infra
module "xebikart-ml-infra-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "ml-infra"
  repo_description = "Infrastructure support for ML"
  repo_site_url    = "TODO"
  repo_visibility_private = false

  archived = true

  additional_topics = ["ml", "infra"]
}

# ML Tubes
module "xebikart-ml-tubes-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "ml-tubes"
  repo_description = "Repo to easily share ML datasets"
  repo_site_url    = "TODO"
  repo_visibility_private = false

  additional_topics = ["ml", "datasets", "sharing"]
}

