# Dashboard
module "xebikart-dashboard-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "dashboard "
  repo_description = "TODO"
  repo_site_url    = "http://dashboard.xebik.art"

  allow_merge_commit = false
  additional_topics  = ["links"]
}

# State API
module "xebikart-state-api-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "state-api"
  repo_description = "TODO"
  repo_site_url    = "http://state.xebik.art"

  allow_merge_commit = false
  additional_topics  = ["links"]
}

