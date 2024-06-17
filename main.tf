resource "google_container_cluster" "gke_cluster" {
  name     = var.clusterName
  location = var.region
  project = var.project


  initial_node_count = 0
  networking_mode = "VPC_NATIVE"
  node_config{
      disk_size_gb = var.diskSize
      enable_confidential_storage = false
      local_ssd_count = 0
      machine_type = var.machineType
      service_account = "diplom@tensile-will-419716.iam.gserviceaccount.com"
      spot = true 

      advanced_machine_features { 
        enable_nested_virtualization = false 
        threads_per_core = 0 
      }
    }


 node_pool {
    initial_node_count = 1
    node_count = 1
    
    management {
      auto_repair = true
      auto_upgrade = true
    }
    node_config{
      disk_size_gb = var.diskSize
      enable_confidential_storage = false
      machine_type = var.machineType
      service_account = "diplom@tensile-will-419716.iam.gserviceaccount.com"
      spot = true 
       
      shielded_instance_config {
        enable_integrity_monitoring = true 
        enable_secure_boot = false 
      }
      advanced_machine_features { 
        enable_nested_virtualization = false 
        threads_per_core = 0 
      }

    }
    queued_provisioning { 
      enabled = false
    }

  }

  release_channel {
    channel = "REGULAR"
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
  }
 
  timeouts {
    create = "20m"
    update = "20m"
  }

}

