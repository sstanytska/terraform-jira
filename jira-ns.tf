resource "kubernetes_namespace" "jira-ns" {
  metadata {
    annotations {
      name = "jira-annotation"
    }

    labels {
      mylabel = "jira-value"
    }

    name = "terraform-jira-ns"
  }
}
