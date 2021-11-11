output "api_server_url" {
  description = "The URL for the ARO API server"
  value       = module.aro.api_server_url
}

output "web_console_url" {
  description = "The URL for the ARO web console"
  value       = module.aro.web_console_url
}

output "api_address" {
  description = "IPv4 address of the ARO API server"
  value       = module.aro.api_address
}

output "ingress_address" {
  description = "IPv4 address of the default ARO ingress route"
  value       = module.aro.ingress_address
}

output "aro_username" {
  description = "The administrative user account for ARO"
  value       = module.aro.aro_username
}

output "aro_password" {
  description = "The administrative password for ARO"
  value       = module.aro.aro_password
  sensitive   = true
}