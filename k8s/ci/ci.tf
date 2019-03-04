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

resource "kubernetes_pod" "circleci" {
  "metadata" {
    name = "circleci"
    namespace = "${kubernetes_namespace.ci.metadata.name}"
    labels {
      app = "circleci"
    }
  }
  spec {
    container {
      name = "circleci"
      image = "cicleci/openjdk:11-node-browsers-legacy"
    }
  }
}





