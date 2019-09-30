# Labels - Kind

resource "github_issue_label" "xebikart-infra-label-enhancement" {
  repository = data.github_repository.xebikart-infra-repo.name

  name        = "kind/enhancement"
  description = "New feature or request"
  color       = local.label_color_kind
}

resource "github_issue_label" "xebikart-infra-label-question" {
  repository = data.github_repository.xebikart-infra-repo.name

  name        = "kind/question"
  description = "Further information is requested"
  color       = local.label_color_kind
}

resource "github_issue_label" "xebikart-infra-label-bug" {
  repository = data.github_repository.xebikart-infra-repo.name

  name        = "kind/bug"
  description = "Raw reported bug"
  color       = local.label_color_kind
}

