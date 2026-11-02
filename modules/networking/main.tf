resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-security-core"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_address_space]
  tags                = var.tags
}

resource "azurerm_subnet" "pe_subnet" {
  name                 = "snet-private-endpoints"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefixes["pe_subnet"]]
  private_endpoint_network_policies = "Enabled"
}

resource "azurerm_subnet" "workload_subnet" {
  name                 = "snet-workloads"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefixes["workload_subnet"]]
}