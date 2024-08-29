# hub/environments/dev.tfvars

location             = "West US"
hub_resource_group_name  = "1-a8788bf6-playground-sandbox"
hub_vnet_name            = "hub-network-dev"
hub_vnet_address_space   = ["10.0.0.0/16"]
hub_firewall_subnet_prefix = "10.0.1.0/24"
firewall_sku_name        = "AZFW_VNet"
firewall_sku_tier        = "Standard"
environment              = "dev"
tags = {
  Environment = "Dev"
  Project     = "Hub-and-Spoke"
  Resource    = "VNet"
}
