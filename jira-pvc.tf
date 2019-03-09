resource "kubernetes_persistent_volume" "jira-pv" {
  metadata {
    name = "terraform-jira"
  }

  spec {
    capacity {
      storage = "30Gi"
    }

    access_modes = ["ReadWriteOnce"]

    persistent_volume_source {
      gce_persistent_disk {
        pd_name = "jira-pv-pd"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "jira-pvc" {
  metadata {
    name = "terraform-jira"
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests {
        storage = "20Gi"
      }
    }

    volume_name = "${kubernetes_persistent_volume.jira-pv.metadata.0.terraform-jira}"
  }
}
