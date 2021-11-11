resource "time_sleep" "aro_cluster_init" {
  create_duration = "60s"
  triggers = {
    "aro_cluster" = azurerm_resource_group_template_deployment.aro_cluster.output_content
  }
}

data "external" "aro_api_details" {
  depends_on = [time_sleep.aro_cluster_init]
  program    = ["az", "aro", "show", "-n", var.cluster_name, "-g", var.aro_resource_group_name, "--query", "apiserverProfile", "-o", "json"]
}

data "external" "aro_web_console_details" {
  depends_on = [time_sleep.aro_cluster_init]
  program    = ["az", "aro", "show", "-n", var.cluster_name, "-g", var.aro_resource_group_name, "--query", "consoleProfile", "-o", "json"]
}

data "external" "aro_credentials" {
  depends_on = [time_sleep.aro_cluster_init]
  program    = ["az", "aro", "list-credentials", "-n", var.cluster_name, "-g", var.aro_resource_group_name]
}

data "external" "aro_ingress_details" {
  depends_on = [time_sleep.aro_cluster_init]
  program    = ["az", "aro", "show", "-n", var.cluster_name, "-g", var.aro_resource_group_name, "--query", "ingressProfiles[0]", "-o", "json"]
}