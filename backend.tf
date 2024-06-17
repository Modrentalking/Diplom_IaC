  terraform {
 backend "gcs" {
  credentials = "./state.json"
   bucket  = "508c13a4b2851be0-bucket-tfstate"
   prefix  = "terraform/state"
 }
}
 