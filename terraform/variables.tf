variable "location" {
  description = "Azure region for resource creation."
  type        = string
  default     = "UK South"
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default = {
    "source"  = "https://github.com/blakyaks/aro-terraform"
    "contact" = "solutions@blakyaks.com"
  }
}

variable "environment" {
  description = "Environment identifier used in resource naming convention."
  type        = string
  default     = "dev"
}

variable "network" {
  description = "Parameters used in consruction of the ARO network resources."
  type = object({
    vnet_address_space = list(string)
    master_subnet_cidr = list(number)
    worker_subnet_cidr = list(number)
  })
  default = {
    vnet_address_space = ["10.10.0.0/23"]
    master_subnet_cidr = [1, 0]
    worker_subnet_cidr = [1, 1]
  }
}

variable "domain_name" {
  description = "The private DNS zone used for private ARO cluster names."
  type        = string
  default     = ""
}

variable "pull_secret_file" {
  description = "Red Hat pull secret file for the ARO cluster."
  type        = string
  default     = ""
}

variable "aro_properties" {
  description = "Deployment properties for the ARO cluster."
  default     = {}
  type = object({
    version               = optional(string)
    public_cluster        = optional(bool)
    pod_cidr              = optional(string)
    service_cidr          = optional(string)
    master_node_sku       = optional(string)
    worker_node_sku       = optional(string)
    worker_node_disk_size = optional(number)
    worker_node_count     = optional(number)
    worker_pool_name      = optional(string)
  })
}
