variable "region" {
  description = "Deployment region"
  type = string
  default = "us-central1-a"
}
variable "project" {
  description = "Project name"
  type = string
}
variable "clusterName" {
  description = "Name of our Cluster"
  type = string
}