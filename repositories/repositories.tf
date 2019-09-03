data "github_repository" "xebikart-infra-repo" {
  full_name = "xebia-france/xebikart-infra"
}

module "xebikart-links-github-repo" {
  source = "./modules/xebikart-github-repo"

  repo_name = "links"
  repo_description = "Useful links webpage"
  repo_site_url = "http://links.xebik.art"

  allow_merge_commit = false
  additional_topics = ["links"]
}
