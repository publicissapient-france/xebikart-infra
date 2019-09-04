# Dashboard
module "xebikart-dashboard-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "dashboard "
  repo_description = "Information display front-end : dashboard, leaderboard, etc."
  repo_site_url    = "http://dashboard.xebik.art"

  allow_merge_commit = false
  additional_topics  = ["dashboard", "front", "react"]
}

# State API
module "xebikart-state-api-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "state-api"
  repo_description = "Backend to manage race state and send informations to the Dashboard"
  repo_site_url    = "http://state.xebik.art"

  allow_merge_commit = false
  additional_topics  = ["back", "state", "mqtt", "sse"]
}

