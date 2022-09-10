terraform {
  backend "gcs" {
    bucket = "wordappiacstate"
    prefix = "iacstate"
  }
}

resource "google_cloudbuild_trigger" "word-replc-trigger" {

  trigger_template {
    branch_name = "^main$"
    repo_name   = "github_maheshmohanmu_wordreplaceapp"
  }
  filename = "cloudbuilddeploy.yaml"
}

provider "google" {
  project = "exalted-point-361615"
  region  = "us-central1"
  zone    = "us-central1-c"
}