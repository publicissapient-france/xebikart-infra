# Labels - Components

resource "github_issue_label" "xebikart-infra-label-k8s" {
  repository = "${data.github_repository.xebikart-infra-repo.name}"

  name       = "component/k8s"
  description = "Component - Kubernetes cluster itself"
  color      = "${local.label_color_component}"
}

resource "github_issue_label" "xebikart-infra-label-rabbitmq" {
  repository = "${data.github_repository.xebikart-infra-repo.name}"

  name       = "component/rabbitmq"
  description = "Component - RabbitMQ"
  color      = "${local.label_color_component}"
}

resource "github_issue_label" "xebikart-infra-label-smoketestapp" {
  repository = "${data.github_repository.xebikart-infra-repo.name}"

  name       = "component/smoketest-app"
  description = "Component - Smoketest App"
  color      = "${local.label_color_component}"
}
