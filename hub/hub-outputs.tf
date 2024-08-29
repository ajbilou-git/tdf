# hub/outputs.tf


output "hub_vnet_id" {
  value = azurerm_virtual_network.hub_vnet.id
}

output "hub_vnet_name" {
  value = azurerm_virtual_network.hub_vnet.name
}

output "hub_firewall_private_ip" {
  value = azurerm_firewall.hub_fw.ip_configuration[0].private_ip_address
}
