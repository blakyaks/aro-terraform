locals {
  aro_properties = defaults(var.aro_properties, {
    version               = "4.8.11"
    pod_cidr              = "10.128.0.0/14"
    public_cluster        = true
    service_cidr          = "172.30.0.0/16"
    master_node_sku       = "Standard_D8s_v3"
    worker_node_sku       = "Standard_D4s_v3"
    worker_node_disk_size = 128
    worker_node_count     = 3
    worker_pool_name      = "worker"
  })
  private_domain_name = length(var.domain_name) > 0 ? var.domain_name : "aro.${local.id}.${var.environment}.local"
  id                  = random_string.id.result
  resource_names = {
    resource_group_aro = format("rg-%s-%s-aro", var.environment, local.id)
    resource_group_net = format("rg-%s-%s-aro-net", var.environment, local.id)
    virtual_network    = format("vnet-%s-%s-aro", var.environment, local.id)
    service_principal  = format("sp-%s-%s-aro", var.environment, local.id)
    cluster_name       = format("%s-%s-aro", var.environment, local.id)
  }
  domain_name            = local.aro_properties.public_cluster == true ? local.resource_names.cluster_name : local.private_domain_name
  pull_secret_data       = length(var.pull_secret_file) > 0 ? base64encode(file(var.pull_secret_file)) : ""
  aro_homepage_url       = local.aro_properties.public_cluster == true ? format("https://console-openshift-console.apps.%s.%s.aroapp.io/", local.resource_names.cluster_name, lower(replace(var.location, " ", ""))) : format("https://console-openshift-console.apps.%s/", local.domain_name)
  aad_oauth_callback_url = local.aro_properties.public_cluster == true ? format("https://oauth-openshift.apps.%s.%s.aroapp.io/oauth2callback/AAD", local.resource_names.cluster_name, lower(replace(var.location, " ", ""))) : format("https://oauth-openshift.apps.%s/", local.domain_name)
}

resource "random_string" "id" {
  length  = 5
  special = false
  lower   = true
  upper   = false
}