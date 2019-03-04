variable "gkeEndpoint" {}

provider "kubernetes" {
  host = "${var.gkeEndpoint}"
}

resource "kubernetes_namespace" "ci" {
  "metadata" {
    name = "ci"
  }
}

resource "kubernetes_service" "circleci" {
  "metadata" {
    name = "circleci"
    namespace = "${kubernetes_namespace.ci.metadata.name}"
  }
  "spec" {
    selector {
      run = "circleci"
    }
  }
}

resource "kubernetes_replication_controller" "circleci" {
  "metadata" {
    name = "circleci"
    namespace = "${kubernetes_namespace.ci.metadata.name}"
  }
  "spec" {
    "selector" {
      run = "circleci"
    }
    "template" {
      container {
        name = "circleci"
        image = "cicleci/openjdk:11-node-browsers-legacy"
      }
    }
  }
}





