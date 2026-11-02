output "key_vault_id" { value = azurerm_key_vault.vault.id }
output "key_vault_uri" { value = azurerm_key_vault.vault.vault_uri }
output "managed_identity_principal_id" { value = azurerm_user_assigned_identity.kv_identity.principal_id }