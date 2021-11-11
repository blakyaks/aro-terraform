terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      version = ">= 2.75.0"
    }
    time = {
      version = ">= 0.7.2"
    }
    external = {
      version = ">= 2.1.0"
    }
  }
}
