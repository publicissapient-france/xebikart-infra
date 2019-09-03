resource "github_issue_label" "component-label" {
  repository = "${var.repository}"

  name       = "component/${var.component_name}"
  description = "Component - ${var.component_description}"
  color      = "${local.label_color_component}"
}
