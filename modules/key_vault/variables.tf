variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "vault_name" { type = string }
variable "purge_protection_enabled" { type = bool; default = true }
variable "secrets" { type = map(string); default = {} }
variable "keys" { type = list(string); default = [] }
variable "tags" { type = map(string); default = {} }