variable "location" {
  description = "Azure location for resource creation"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resources"
  type        = map(any)
}

variable "cluster_name" {
  description = "Name for the ARO cluster resource (ARM) object"
  type        = string
}

variable "aro_resource_group_name" {
  description = "Resource group name for the ARO cluster object"
  type        = string
}

variable "aro_version" {
  description = "Version of ARO to be installed"
  type        = string
  default     = "4.8.11"
}

variable "public_cluster" {
  description = "Define whether the cluster is publically visible"
  type        = bool
  default     = true
}

variable "pull_secret" {
  description = "Red Hat pull secret for the ARO cluster in Base64 encoded string format."
  type        = string
  default     = ""
}

variable "vnet_id" {
  description = "Virtual network ID that will host the ARO worker and master nodes"
  type        = string
}

variable "master_subnet_name" {
  description = "Subnet name for the master nodes"
  type        = string
  default     = "aro-master"
}

variable "worker_subnet_name" {
  description = "Subnet name for the worker nodes"
  type        = string
  default     = "aro-worker"
}

variable "node_resource_group_name" {
  description = "Name of the ARO-managed node resource group"
  type        = string
}

variable "domain_name" {
  description = "DNS Domain name for the ARO cluster"
  type        = string
}

variable "aro_client_id" {
  description = "Client (application) ID for the ARO cluster service principal"
  type        = string
}

variable "aro_client_secret" {
  description = "Client secret for the ARO cluster service principal"
  type        = string
  sensitive   = true
}

variable "pod_cidr" {
  description = "CIDR range for the pod overlay network"
  type        = string
  default     = "10.128.0.0/14"
}

variable "service_cidr" {
  description = "CIDR range for the service overley network"
  type        = string
  default     = "172.30.0.0/16"
}

variable "master_node_sku" {
  description = "Azure vitual machine SKU for the master nodes"
  type        = string
  default     = "Standard_D8s_v3"
}

variable "worker_node_sku" {
  description = "Azure vitual machine SKU for the worker nodes"
  type        = string
  default     = "Standard_D4s_v3"
}

variable "worker_node_disk_size" {
  description = "Data disk size for the ARO worker nodes, in GB"
  type        = number
  default     = 128
}

variable "worker_node_count" {
  description = "Number of worker nodes in the ARO cluster"
  type        = number
  default     = 3
}

variable "worker_pool_name" {
  description = "Name to be applied to the default worker pool"
  type        = string
  default     = "worker"
}