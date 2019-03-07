resource "kubernetes_namespace" "ci" {
  metadata {
    name = "ci"
  }
}

resource "kubernetes_service" "circleci" {
  metadata {
    name = "circleci"
    //namespace = "${kubernetes_namespace.ci.metadata.name}"
    namespace = "ci"
  }
  spec {
    selector {
      run = "circleci"
    }
  }
}

resource "kubernetes_pod" "circleci" {
  metadata {
    name = "circleci"
    //namespace = "${kubernetes_namespace.ci.metadata.name}"
    namespace = "ci"
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





