# Android AR
module "xebikart-android_ar-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name        = "android-ar"
  repo_description = "Augmented Reality Android application"
  repo_site_url    = "TODO"
  repo_visibility_private = false

  additional_topics = ["android", "ar", "mobile"]
}

