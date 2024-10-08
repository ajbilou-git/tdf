# hub/main.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.5.7"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_virtual_network" "hub_vnet" {
  name                = var.hub_vnet_name
  address_space       = var.hub_vnet_address_space
  location            = var.location
  resource_group_name = var.hub_resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "hub_fw_subnet" {
  name                 = var.hub_fw_subnet_name
  resource_group_name  = var.hub_resource_group_name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = [var.hub_firewall_subnet_prefix]
}

resource "azurerm_subnet" "hub_fw_mgmt_subnet" {
  name                 = var.hub_fw_mgmt_subnet_name
  resource_group_name  = var.hub_resource_group_name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = [var.hub_firewall_mgmt_subnet_prefix]
}

resource "azurerm_public_ip" "hub_fw_ip" {
  name                = var.hub_fw_public_ip_name
  location            = var.location
  resource_group_name = var.hub_resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_public_ip" "hub_fw_mgmt_ip" {
  name                = var.hub_fw_mgmt_public_ip_name
  location            = var.location
  resource_group_name = var.hub_resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_firewall" "hub_fw" {
  name                = var.hub_firewall_name
  location            = var.location
  resource_group_name = var.hub_resource_group_name
  sku_name            = var.firewall_sku_name
  sku_tier            = var.firewall_sku_tier

  ip_configuration {
    name                 = "ip_configuration"
    subnet_id            = azurerm_subnet.hub_fw_subnet.id
    public_ip_address_id = azurerm_public_ip.hub_fw_ip.id
  }

  management_ip_configuration {
    name                 = "mgmt_ip_configuration"
    subnet_id            = azurerm_subnet.hub_fw_mgmt_subnet.id
    public_ip_address_id = azurerm_public_ip.hub_fw_mgmt_ip.id
  }
}