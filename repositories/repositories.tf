data "github_repository" "xebikart-infra-repo" {
  full_name = "xebia-france/xebikart-infra"
}

resource "github_repository" "xebikart-links-repo" {
  # Note : project will be Open Source by default
  name        = "xebikart-links"
  description = "XebiKart - Useful links webpage"
  homepage_url = "http://links.xebik.art"

  has_projects = false
  has_wiki = false
  allow_merge_commit = false
  topics = [
    "xebicon19",
    "xebikart",
    "links"
  ]
}
