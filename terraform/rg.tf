resource "azurerm_resource_group" "aro" {
  name     = local.resource_names.resource_group_aro
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "net" {
  name     = local.resource_names.resource_group_net
  location = var.location
  tags     = var.tags
}
