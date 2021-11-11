terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      version = ">= 2.75.0" # https://registry.terraform.io/providers/hashicorp/azurerm/latest
    }
  }
}
