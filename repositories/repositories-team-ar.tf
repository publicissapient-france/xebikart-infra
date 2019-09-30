# Android AR
module "xebikart-android_ar-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "android-ar"
  repo_description = "Augmented Reality Android application"
  repo_site_url    = "TODO"

  additional_topics = ["android", "AR", "mobile"]
}

