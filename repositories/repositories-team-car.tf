# Car
module "xebikart-car-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "car"
  repo_description = "Everything about the cars themselves!"
  repo_site_url    = "https://www.donkeycar.com/"

  additional_topics = ["car", "donkeycar"]
}

# Donkeypart PS4
module "xebikart-donkeypart-ps4-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "donkeypart_ps4"
  repo_description = "Donkeycart PS4 Joystick controller - forked from autorope/donkeypart_ps3_controller"
  repo_site_url    = "https://github.com/autorope/donkeypart_ps3_controller"

  additional_topics = ["car", "donkeycar", "ps4", "controller", "remote"]
}

