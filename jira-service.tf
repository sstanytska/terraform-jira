resource "kubernetes_service" "jira-svs" {
  metadata {
    name = "terraform-jira"
  }

  spec {
    selector {
      app = "${kubernetes_pod.jira-pod.metadata.0.labels.app}"
    }

    session_affinity = "ClientIP"

    port {
      port        = 8080
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_pod" "jira-pod" {
  metadata {
    name = "terraform-jira"

    labels {
      app = "jira"
    }
  }

  spec {
    container {
      image = "gcr.io/hightowerlabs/jira:7.3.6-standalone"
      name  = "jira"
    }
  }
}
