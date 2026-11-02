variable "project_name" {
  type        = string
  default     = "secsuite"
}

variable "environment" {
  type        = string
  default     = "prod"
}

variable "location" {
  type        = string
  default     = "eastus"
}

variable "purge_protection_enabled" {
  type        = bool
  default     = true
}

variable "vnet_address_space" {
  type        = string
  default     = "10.150.0.0/16"
}

variable "subnet_prefixes" {
  type        = map(string)
  default = {
    pe_subnet   = "10.150.1.0/24"
    workload_subnet = "10.150.2.0/24"
  }
}

variable "secrets" {
  description = "Map of initial secrets to deploy using for_each"
  type        = map(string)
  default = {
    "db-connection-string" = "Server=tcp:sql-srv.database.windows.net;Database=core;Encrypt=True;"
    "api-jwt-secret-key"   = "Production-Enterprise-Super-Secret-Token-2026!#"
    "payment-gateway-token" = "pg_live_tok_9823482734982374"
  }
}

variable "keys" {
  description = "List of cryptographic RSA keys to provision"
  type        = list(string)
  default     = ["cmk-disk-encryption-key", "token-signing-key"]
}

variable "tags" {
  type        = map(string)
  default     = {}
}