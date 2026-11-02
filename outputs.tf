output "key_vault_id" {
  description = "The ID of the provisioned Azure Key Vault"
  value       = module.key_vault.key_vault_id
}

output "key_vault_uri" {
  description = "The URI of the Azure Key Vault"
  value       = module.key_vault.key_vault_uri
}

output "private_endpoint_ip" {
  description = "Private IP of the Key Vault Private Endpoint"
  value       = module.private_link.private_ip_address
}

output "managed_identity_id" {
  description = "User-Assigned Managed Identity Principal ID"
  value       = module.key_vault.managed_identity_principal_id
}