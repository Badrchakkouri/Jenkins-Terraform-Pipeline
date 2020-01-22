terraform {
  backend "local" {
    path = "/share/terraform.tfstate"
  }
}