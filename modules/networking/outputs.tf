output "vnet_id" { value = azurerm_virtual_network.vnet.id }
output "private_endpoint_subnet_id" { value = azurerm_subnet.pe_subnet.id }
output "workload_subnet_id" { value = azurerm_subnet.workload_subnet.id }