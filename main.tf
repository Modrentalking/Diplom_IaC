resource "google_container_cluster" "gke_cluster" {
  name     = var.clusterName
  location = var.region
  project  = var.project

  initial_node_count = 0
  networking_mode    = "VPC_NATIVE"

}
 resource "google_container_node_pool" "default" {
  name = "default-pool"
  cluster    = var.clusterName
  location = var.region
  project  = var.project
  node_count = 1

  node_config {
    disk_size_gb = 50
    enable_confidential_storage = false
    machine_type = "n1-standard-1"
    service_account = "diplom@tensile-will-419716.iam.gserviceaccount.com"
    spot = true 

    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = false
    }

    advanced_machine_features {
      enable_nested_virtualization = false
      threads_per_core             = 0
    }
  }
  queued_provisioning { 
      enabled = false 
  }
}

resource "google_container_node_pool" "logging" {
  name       = "logging"
  cluster    = var.clusterName
  node_count = 1

  node_config {
    disk_size_gb = 50
    enable_confidential_storage = false      
    machine_type = "n1-standard-1"
    service_account = "diplom@tensile-will-419716.iam.gserviceaccount.com"
    spot = true 

    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = false
    }
    advanced_machine_features {
      enable_nested_virtualization = false
      threads_per_core             = 0
    }

  }
  queued_provisioning { 
      enabled = false 
  }
}