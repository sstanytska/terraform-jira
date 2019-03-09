resource "kubernetes_deployment" "jira-deployment" {
  metadata {
    name      = "terraform-jira"
    namespace = "terraform-jira-ns"

    labels {
      test = "jira"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        test = "jira"
      }
    }

    template {
      metadata {
        labels {
          test = "jira"
        }
      }

      spec {
        container {
          image = "gcr.io/hightowerlabs/jira:7.3.6-standalone"
          name  = "jira"

          resources {
            limits {
              cpu    = "2"
              memory = "500Mi"
            }

            requests {
              cpu    = "2"
              memory = "500Mi"
            }
          }
        }
      }
    }
  }
}
