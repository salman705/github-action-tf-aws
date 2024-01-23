terraform {
  backend "s3" {
    bucket = "github-terraform-sonarqube-nexus"
    key = "github-terraform-sonarqube-nexus.tfstate"
    region = "us-east-1"
  }
}