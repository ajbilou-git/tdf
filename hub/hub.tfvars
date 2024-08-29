# hub/environments/dev.tfvars

location                        = "West US"
hub_resource_group_name         = "1-a8788bf6-playground-sandbox"
hub_vnet_name                   = "hub-network-dev"
hub_vnet_address_space          = ["10.0.0.0/16"]
hub_fw_subnet_name              = "AzureFirewallSubnet"
hub_firewall_subnet_prefix      = "10.0.1.0/24"
hub_fw_mgmt_subnet_name         = "AzureFirewallManagementSubnet"
hub_firewall_mgmt_subnet_prefix = "10.0.2.0/24"
hub_fw_public_ip_name           = "hub-firewall-ip"
hub_fw_mgmt_public_ip_name      = "hub-firewall-mgmt-ip"
hub_firewall_name               = "hub-firewall"
firewall_sku_name               = "AZFW_VNet"
firewall_sku_tier               = "Basic"
environment                     = "dev"
tags = {
  Environment = "Dev"
  Project     = "Hub-and-Spoke"
  Resource    = "VNet"
}