variable "region" {
  description = "Deployment region"
  default = "us-central1-a"
}
variable "project" {
  description = "Project name"
}
variable "clusterName" {
  description = "Name of our Cluster"
}
variable "diskSize" {
  description = "Node disk size in GB"
}

variable "machineType" {
  description = "Node Instance machine type"
}