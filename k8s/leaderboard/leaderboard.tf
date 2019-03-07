// Leaderboard
resource "kubernetes_namespace" "leaderboard" {
  metadata {
    name = "leaderboard"
  }
}

resource "kubernetes_service" "leaderboard" {
  metadata {
    name = "leaderboard"
    //namespace = "${kubernetes_namespace.leaderboard.metadata.name}"
     namespace = "leaderboard"
  }
  spec {
    session_affinity = "ClientIP"
    selector {
      app = "leaderboard"
    }
    port {
      port = 80
      target_port = 80
      protocol = "TCP"
    }
    type = "LoadBalancer"
  }
}

resource "kubernetes_deployment" "leaderboard" {
  metadata {
    name = "leaderboard"
    labels {
      test = "leaderboard"
    }
  }
  spec {
    replicas = 3
    selector {
      match_labels {
        app = "leaderboard"
      }
    }
    template {
      "metadata" {
        labels {
          app = "leaderboard"
        }
      }
      spec {
        container {
          name = "hello-world"
          image = "hello-world:latest"
          // Test image
        }
      }
    }
  }
}