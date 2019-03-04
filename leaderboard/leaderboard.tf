
// Leaderboard
resource "kubernetes_namespace" "leaderboard" {
  "metadata" {
    name = "leaderboard"
  }
}

resource "kubernetes_service" "leaderboard" {
  "metadata" {
    name = "leaderboard"
    namespace = "${kubernetes_namespace.leaderboard.metadata.name}"
  }
  "spec" {
    selector {
      app = "leaderboard"
    }
    port {
      port = 80
      protocol = "TCP"
    }
  }
}

resource "kubernetes_replication_controller" "leaderboard" {
  "metadata" {
    name = "leaderboard"
    namespace = "${kubernetes_namespace.leaderboard.metadata.name}"
  }
  "spec" {
    "selector" {
      run = "leaderboard"
    }
    "template" {
      container {
        name = "hello-world"
        image = "hello-world:latest" // Test image
      }
    }
    replicas = 2
  }
}