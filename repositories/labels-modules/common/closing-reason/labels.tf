# Labels - Closing reason

resource "github_issue_label" "xebikart-infra-label-duplicate" {
  repository = "${var.repository}"

  name       = "closing-reason/duplicate"
  description = "This issue or pull request already exists"
  color      = "${local.label_color_closing-reason}"
}

resource "github_issue_label" "xebikart-infra-label-wontfix" {
  repository = "${var.repository}"

  name       = "closing-reason/wontfix"
  description = "This will not be worked on"
  color      = "${local.label_color_closing-reason}"
}

resource "github_issue_label" "xebikart-infra-label-alreadyfixed" {
  repository = "${var.repository}"

  name       = "closing-reason/already-fixed"
  description = "This issue is already fixed or feature already implemented"
  color      = "${local.label_color_closing-reason}"
}
