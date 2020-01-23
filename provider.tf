provider "aws" {
  region = var.region
  shared_credentials_file = "/share/aws_creds"
}