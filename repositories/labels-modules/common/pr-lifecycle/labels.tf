# Labels - PR Lifecycle

resource "github_issue_label" "xebikart-infra-label-indiscussion" {
  repository = "${var.repository}"

  name       = "pr-lifecycle/in-discussion"
  description = "PR - In discussion (first review done)"
  color      = "${local.label_color_pr-lifecycle}"
}

resource "github_issue_label" "xebikart-infra-label-waitingforreview" {
  repository = "${var.repository}"

  name       = "pr-lifecycle/waiting-for-first-review"
  description = "PR - Waiting for the first review"
  color      = "${local.label_color_pr-lifecycle}"
}

resource "github_issue_label" "xebikart-infra-label-wip" {
  repository = "${var.repository}"

  name       = "pr-lifecycle/wip"
  description = "PR - Work in Progress"
  color      = "${local.label_color_pr-lifecycle}"
}
