# spoke/environments/dev.tfvars

spoke_location           = "East US"
spoke_resource_group_name = "spoke-resources-dev"
spoke_vnet_name          = "spoke-network-dev"
spoke_vnet_address_space = ["10.1.0.0/16"]
spoke_subnet_prefix      = "10.1.1.0/24"
environment              = "dev"
tags = {
  Environment = "Development"
  Project     = "Hub-and-Spoke"
}
hub_vnet_name            = "hub-network-dev"
hub_resource_group_name  = "hub-resources-dev"
