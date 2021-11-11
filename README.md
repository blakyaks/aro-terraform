<!-- BEGIN_TF_DOCS -->
<link rel="stylesheet" href="https://assets.blakyaks.com/css/blakyaks.css"></link>
<img class="headerlogo"><div class="header"></div>
<div class="module_title">aro-terraform</div>

Example code to support our **Deconstructing Azure Red Hat OpenShift Deployment** blog.

## Pre-Requisites

- Ensure Azure CLI is installed and up-to-date;
- Perform `az login` prior to executing Terraform code (or set environment variables to support the `azurerm` provider);
- If using CLI context, ensure you have targeted the correct subscription using `az account set --subscription <sub>` prior to execution.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.6.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.75.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.8.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.84.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aro_properties"></a> [aro\_properties](#input\_aro\_properties) | Deployment properties for the ARO cluster. | <pre>object({<br>    version               = optional(string)<br>    public_cluster        = optional(bool)<br>    pod_cidr              = optional(string)<br>    service_cidr          = optional(string)<br>    master_node_sku       = optional(string)<br>    worker_node_sku       = optional(string)<br>    worker_node_disk_size = optional(number)<br>    worker_node_count     = optional(number)<br>    worker_pool_name      = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The private DNS zone used for private ARO cluster names. | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment identifier used in resource naming convention. | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for resource creation. | `string` | `"UK South"` | no |
| <a name="input_network"></a> [network](#input\_network) | Parameters used in consruction of the ARO network resources. | <pre>object({<br>    vnet_address_space = list(string)<br>    master_subnet_cidr = list(number)<br>    worker_subnet_cidr = list(number)<br>  })</pre> | <pre>{<br>  "master_subnet_cidr": [<br>    1,<br>    0<br>  ],<br>  "vnet_address_space": [<br>    "10.10.0.0/23"<br>  ],<br>  "worker_subnet_cidr": [<br>    1,<br>    1<br>  ]<br>}</pre> | no |
| <a name="input_pull_secret_file"></a> [pull\_secret\_file](#input\_pull\_secret\_file) | Red Hat pull secret file for the ARO cluster. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resources. | `map(string)` | <pre>{<br>  "contact": "solutions@blakyaks.com",<br>  "source": "https://github.com/blakyaks/aro-terraform"<br>}</pre> | no |

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
| [azuread_application.aro](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_password.aro](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_service_principal.aro](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_resource_group.aro](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.net](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.cluster_aro_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.rp_aro_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_subnet.master](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.worker](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.aro](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [random_string.id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azuread_service_principal.aro_rp](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aro"></a> [aro](#module\_aro) | ./modules/module_aro_arm | n/a |

</div>
<!-- END_TF_DOCS -->