# Car
module "xebikart-car-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "car"
  repo_description = "Everything about the cars themselves!"
  repo_site_url    = "https://www.donkeycar.com/"
  repo_visibility_private = false

  additional_topics = ["car", "donkeycar"]
}
