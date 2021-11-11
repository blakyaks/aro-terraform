data "azurerm_subscription" "current" {}

resource "azurerm_resource_group_template_deployment" "aro_cluster" {

  name                = "${var.cluster_name}-deployment"
  resource_group_name = var.aro_resource_group_name

  deployment_mode = "Incremental"
  template_content = templatefile("${path.module}/templates/aro_deployment.json",
  { public_cluster = var.public_cluster, pull_secret = var.pull_secret })

  parameters_content = jsonencode({
    cluster_name        = { value = var.cluster_name }
    tags                = { value = jsonencode(var.tags) }
    location            = { value = var.location }
    vnet_id             = { value = var.vnet_id }
    subnet_master       = { value = var.master_subnet_name }
    subnet_worker       = { value = var.worker_subnet_name }
    node_resource_group = { value = var.node_resource_group_name }
    pull_secret         = { value = length(var.pull_secret) > 0 ? base64decode(var.pull_secret) : "" }
    domain              = { value = var.domain_name }
    client_id           = { value = var.aro_client_id }
    client_secret       = { value = var.aro_client_secret }
    pod_cidr            = { value = var.pod_cidr }
    service_cidr        = { value = var.service_cidr }
    master_vm_size      = { value = var.master_node_sku }
    worker_vm_size      = { value = var.worker_node_sku }
    worker_disk_gb      = { value = var.worker_node_disk_size }
    api_visibility      = { value = var.public_cluster ? "Public" : "Private" }
    ingress_visibility  = { value = var.public_cluster ? "Public" : "Private" }
    worker_pool_name    = { value = var.worker_pool_name }
    worker_nodes        = { value = var.worker_node_count }
    subscription_id     = { value = data.azurerm_subscription.current.id }
    version             = { value = var.aro_version }
  })

  timeouts {
    create = "90m"
  }

  lifecycle {
    ignore_changes = [parameters_content, template_content]
  }

}
