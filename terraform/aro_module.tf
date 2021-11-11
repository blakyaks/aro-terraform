module "aro" {
  source = "./modules/module_aro_arm"

  location                 = lower(replace(var.location, " ", ""))
  tags                     = var.tags
  cluster_name             = local.resource_names.cluster_name
  aro_version              = local.aro_properties.version
  public_cluster           = local.aro_properties.public_cluster
  pull_secret              = local.pull_secret_data
  vnet_id                  = azurerm_virtual_network.aro.id
  master_subnet_name       = azurerm_subnet.master.name
  worker_subnet_name       = azurerm_subnet.worker.name
  aro_resource_group_name  = azurerm_resource_group.aro.name
  node_resource_group_name = format("%s-managed", azurerm_resource_group.aro.name)
  domain_name              = local.domain_name
  aro_client_id            = azuread_application.aro.application_id
  aro_client_secret        = azuread_application_password.aro.value
  pod_cidr                 = local.aro_properties.pod_cidr
  service_cidr             = local.aro_properties.service_cidr
  master_node_sku          = local.aro_properties.master_node_sku
  worker_node_sku          = local.aro_properties.worker_node_sku
  worker_node_disk_size    = local.aro_properties.worker_node_disk_size
  worker_node_count        = local.aro_properties.worker_node_count
  worker_pool_name         = "worker" #  Name changes are currently not supported by the ARO provider

  depends_on = [azurerm_role_assignment.cluster_aro_vnet, azurerm_role_assignment.rp_aro_vnet]

}
