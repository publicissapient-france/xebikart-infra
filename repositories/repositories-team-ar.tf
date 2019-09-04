# Android
module "xebikart-android-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "android"
  repo_description = "TODO"
  repo_site_url    = "TODO"

  additional_topics = ["TODO"]
}

# Android AR
module "xebikart-android_ar-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "android-ar"
  repo_description = "Augmented Reality Android application"
  repo_site_url    = "TODO"

  additional_topics = ["android", "AR", "mobile"]
}

