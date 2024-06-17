 provider "google" {
  credentials = file("state.json")
  project     = "modest-dev-418814"
}
 provider "google" {
  credentials = file("cluster.json")
  project     = "tensile-will-419716"
  alias       = "gcp-service-project"
}