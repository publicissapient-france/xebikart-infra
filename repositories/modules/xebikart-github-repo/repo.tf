resource "github_repository" "repo" {
  # Note : project will be Open Source by default
  name        = "xebikart-${var.repo_name}"
  description = "XebiKart - ${var.repo_description}"
  homepage_url = "${var.repo_site_url}"

  has_issues = true
  has_downloads = true
  has_projects = false
  has_wiki = false

  private = "${var.repo_visibility_private}"
  allow_merge_commit = "${var.allow_merge_commit}"
  topics = concat("${local.default_topics}", "${var.additional_topics}")
}

# TODO
#resource "github_repository_team" "team-membership" {
#}
