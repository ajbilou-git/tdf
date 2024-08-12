# spoke/outputs.tf

output "spoke_resource_group_name" {
  value = azurerm_resource_group.spoke_rg.name
}

output "spoke_vnet_id" {
  value = azurerm_virtual_network.spoke_vnet.id
}

output "spoke_vnet_name" {
  value = azurerm_virtual_network.spoke_vnet.name
}

output "spoke_subnet_id" {
  value = azurerm_subnet.spoke_subnet.id
}
