# hub/environments/dev.tfvars

hub_location             = "West US"
hub_resource_group_name  = "1-5bf614be-playground-sandbox"
hub_vnet_name            = "hub-network-dev"
hub_vnet_address_space   = ["10.0.0.0/16"]
hub_firewall_subnet_prefix = "10.0.1.0/24"
environment              = "dev"
tags = {
  Environment = "Dev"
  Project     = "Hub-and-Spoke"
  Resource    = "VNet"
}
