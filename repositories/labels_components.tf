# Labels - Components

module "xebikart-infra_label_component-k8s" {
  source = "./labels-modules/wrappers/component"
  repository = "${data.github_repository.xebikart-infra-repo.name}"

  component_name = "k8s"
  component_description = "Kubernetes cluster itself"
}

module "xebikart-infra_label_component-rabbitmq" {
  source = "./labels-modules/wrappers/component"
  repository = "${data.github_repository.xebikart-infra-repo.name}"

  component_name = "rabbitmq"
  component_description = "RabbitMQ cluster"
}

module "xebikart-infra_label_component-smoketestapp" {
  source = "./labels-modules/wrappers/component"
  repository = "${data.github_repository.xebikart-infra-repo.name}"

  component_name = "smoketest-app"
  component_description = "Smoketest Application"
}

module "xebikart-infra_label_component-externaldns" {
  source = "./labels-modules/wrappers/component"
  repository = "${data.github_repository.xebikart-infra-repo.name}"

  component_name = "external-dns"
  component_description = "ExternalDNS"
}
