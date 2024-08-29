# spoke/main.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # Utilisez la version la plus récente compatible avec Terraform 1.5.x
    }
  }
  required_version = ">= 1.5.7"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

data "terraform_remote_state" "hub" {
  backend = "azurerm"
  config = {
    resource_group_name  = "1-a8788bf6-playground-sandbox"
    storage_account_name = "tdftfstate"
    container_name       = "tfstate"
    key                  = "hub.tfstate"
  }
}


resource "azurerm_virtual_network" "spoke_vnet" {
  name                = var.spoke_vnet_name
  address_space       = var.spoke_vnet_address_space
  location            = var.location
  resource_group_name = var.spoke_resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "spoke_subnet" {
  name                 = "spoke-subnet"
  resource_group_name  = var.spoke_resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = [var.spoke_subnet_prefix]
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "spoke-to-hub"
  resource_group_name       = var.spoke_resource_group_name
  virtual_network_name      = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id = data.terraform_remote_state.hub.outputs.hub_vnet_id
}

resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = "hub-to-spoke"
  resource_group_name       = var.hub_resource_group_name
  virtual_network_name      = data.terraform_remote_state.hub.outputs.hub_vnet_name
  remote_virtual_network_id = azurerm_virtual_network.spoke_vnet.id
}
