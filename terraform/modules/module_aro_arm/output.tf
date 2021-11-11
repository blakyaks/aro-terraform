output "api_server_url" {
  description = "The URL for the ARO API server"
  value       = data.external.aro_api_details.result.url
}

output "web_console_url" {
  description = "The URL for the ARO web console"
  value       = data.external.aro_web_console_details.result.url
}

output "api_address" {
  description = "IPv4 address of the ARO API server"
  value       = data.external.aro_api_details.result.ip
}

output "ingress_address" {
  description = "IPv4 address of the default ARO ingress route"
  value       = data.external.aro_ingress_details.result.ip
}

output "aro_username" {
  description = "The administrative user account for ARO"
  value       = data.external.aro_credentials.result.kubeadminUsername
}

output "aro_password" {
  description = "The administrative password for ARO"
  value       = data.external.aro_credentials.result.kubeadminPassword
  sensitive   = true
}