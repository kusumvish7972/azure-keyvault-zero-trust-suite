resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

locals {
  common_tags = merge(var.tags, {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Security    = "Zero-Trust"
  })
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location
  tags     = local.common_tags
}

# 1. Child Module: Virtual Network & Subnet with Private Endpoint Policy
module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_address_space  = var.vnet_address_space
  subnet_prefixes     = var.subnet_prefixes
  tags                = local.common_tags
}

# 2. Child Module: Enterprise Key Vault with RBAC & Dynamic Secrets (for_each)
module "key_vault" {
  source                     = "./modules/key_vault"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  vault_name                 = "kv-${var.project_name}-${var.environment}-${random_string.suffix.result}"
  purge_protection_enabled   = var.purge_protection_enabled
  secrets                    = var.secrets
  keys                       = var.keys
  tags                       = local.common_tags
}

# 3. Child Module: Private Endpoint & Private DNS Zone Integration
module "private_link" {
  source              = "./modules/private_link"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  key_vault_id        = module.key_vault.key_vault_id
  subnet_id           = module.networking.private_endpoint_subnet_id
  vnet_id             = module.networking.vnet_id
  tags                = local.common_tags
}