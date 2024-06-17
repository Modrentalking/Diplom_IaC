 provider "google" {
  credentials = file("./cluster.json")
  project     = "tensile-will-419716"
  alias       = "gcp-service-project"
}