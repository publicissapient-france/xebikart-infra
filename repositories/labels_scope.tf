# Labels - Scope

resource "github_issue_label" "xebikart-infra-label-doc" {
  repository = data.github_repository.xebikart-infra-repo.name

  name        = "scope/doc"
  description = "This is about documentation"
  color       = local.label_color_scope
}

resource "github_issue_label" "xebikart-infra-label-adr" {
  repository = data.github_repository.xebikart-infra-repo.name

  name        = "scope/doc/ADR"
  description = "This is about documentation, more specifically ADR"
  color       = local.label_color_scope
}

resource "github_issue_label" "xebikart-infra-label-monitoring" {
  repository = data.github_repository.xebikart-infra-repo.name

  name        = "scope/monitoring"
  description = "This is about monitoring"
  color       = local.label_color_scope
}

