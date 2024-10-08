# spoke/environments/dev.tfvars

location           = "East US"
spoke_resource_group_name = "1-a8788bf6-playground-sandbox"
hub_resource_group_name   = "1-a8788bf6-playground-sandbox"
spoke_vnet_name          = "spoke-network-dev"
spoke_vnet_address_space = ["10.1.0.0/16"]
spoke_subnet_prefix      = "10.1.1.0/24"
environment              = "dev"
tags = {
  Environment = "Development"
  Project     = "Hub-and-Spoke"
}

