terraform {
  backend "s3" {
    bucket = "github-actions-demo123"
    key = "github-terraform-sonarqube-nexus.tfstate"
    region = "us-east-1"
  }
}