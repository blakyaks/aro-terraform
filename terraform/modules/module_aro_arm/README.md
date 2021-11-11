<!-- BEGIN_TF_DOCS -->
<link rel="stylesheet" href="https://assets.blakyaks.com/css/blakyaks.css"></link>
<img class="headerlogo"><div class="header"></div>
<div class="module_title">module_aro_arm</div>

Example code to support our **Deconstructing Azure Red Hat OpenShift Deployment** blog.  This document summarises the ARO wrapper module element of the code.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.75.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.75.0 |
| <a name="provider_external"></a> [external](#provider\_external) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aro_client_id"></a> [aro\_client\_id](#input\_aro\_client\_id) | Client (application) ID for the ARO cluster service principal | `string` | n/a | yes |
| <a name="input_aro_client_secret"></a> [aro\_client\_secret](#input\_aro\_client\_secret) | Client secret for the ARO cluster service principal | `string` | n/a | yes |
| <a name="input_aro_resource_group_name"></a> [aro\_resource\_group\_name](#input\_aro\_resource\_group\_name) | Resource group name for the ARO cluster object | `string` | n/a | yes |
| <a name="input_aro_version"></a> [aro\_version](#input\_aro\_version) | Version of ARO to be installed | `string` | `"4.8.11"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name for the ARO cluster resource (ARM) object | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | DNS Domain name for the ARO cluster | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location for resource creation | `string` | n/a | yes |
| <a name="input_master_node_sku"></a> [master\_node\_sku](#input\_master\_node\_sku) | Azure vitual machine SKU for the master nodes | `string` | `"Standard_D8s_v3"` | no |
| <a name="input_master_subnet_name"></a> [master\_subnet\_name](#input\_master\_subnet\_name) | Subnet name for the master nodes | `string` | `"aro-master"` | no |
| <a name="input_node_resource_group_name"></a> [node\_resource\_group\_name](#input\_node\_resource\_group\_name) | Name of the ARO-managed node resource group | `string` | n/a | yes |
| <a name="input_pod_cidr"></a> [pod\_cidr](#input\_pod\_cidr) | CIDR range for the pod overlay network | `string` | `"10.128.0.0/14"` | no |
| <a name="input_public_cluster"></a> [public\_cluster](#input\_public\_cluster) | Define whether the cluster is publically visible | `bool` | `true` | no |
| <a name="input_pull_secret"></a> [pull\_secret](#input\_pull\_secret) | Red Hat pull secret for the ARO cluster in Base64 encoded string format. | `string` | `""` | no |
| <a name="input_service_cidr"></a> [service\_cidr](#input\_service\_cidr) | CIDR range for the service overley network | `string` | `"172.30.0.0/16"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resources | `map(any)` | n/a | yes |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | Virtual network ID that will host the ARO worker and master nodes | `string` | n/a | yes |
| <a name="input_worker_node_count"></a> [worker\_node\_count](#input\_worker\_node\_count) | Number of worker nodes in the ARO cluster | `number` | `3` | no |
| <a name="input_worker_node_disk_size"></a> [worker\_node\_disk\_size](#input\_worker\_node\_disk\_size) | Data disk size for the ARO worker nodes, in GB | `number` | `128` | no |
| <a name="input_worker_node_sku"></a> [worker\_node\_sku](#input\_worker\_node\_sku) | Azure vitual machine SKU for the worker nodes | `string` | `"Standard_D4s_v3"` | no |
| <a name="input_worker_pool_name"></a> [worker\_pool\_name](#input\_worker\_pool\_name) | Name to be applied to the default worker pool | `string` | `"worker"` | no |
| <a name="input_worker_subnet_name"></a> [worker\_subnet\_name](#input\_worker\_subnet\_name) | Subnet name for the worker nodes | `string` | `"aro-worker"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_address"></a> [api\_address](#output\_api\_address) | IPv4 address of the ARO API server |
| <a name="output_api_server_url"></a> [api\_server\_url](#output\_api\_server\_url) | The URL for the ARO API server |
| <a name="output_aro_password"></a> [aro\_password](#output\_aro\_password) | The administrative password for ARO |
| <a name="output_aro_username"></a> [aro\_username](#output\_aro\_username) | The administrative user account for ARO |
| <a name="output_ingress_address"></a> [ingress\_address](#output\_ingress\_address) | IPv4 address of the default ARO ingress route |
| <a name="output_web_console_url"></a> [web\_console\_url](#output\_web\_console\_url) | The URL for the ARO web console |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group_template_deployment.aro_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource |
| [time_sleep.aro_cluster_init](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [external_external.aro_api_details](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.aro_credentials](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.aro_ingress_details](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.aro_web_console_details](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

</div>
<!-- END_TF_DOCS -->