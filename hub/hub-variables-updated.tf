# hub/variables.tf

variable "location" {
  description = "The Azure region where the hub resources will be created"
  type        = string
}

variable "hub_resource_group_name" {
  description = "The name of the resource group for the hub"
  type        = string
}

variable "hub_vnet_name" {
  description = "The name of the hub virtual network"
  type        = string
}

variable "hub_vnet_address_space" {
  description = "The address space for the hub virtual network"
  type        = list(string)
}

variable "hub_firewall_subnet_prefix" {
  description = "The address prefix for the firewall subnet"
  type        = string
}

variable "environment" {
  description = "The environment (dev, test, prod)"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}


variable "firewall_sku_name" {
  description = "SKU name of the Firewall. Possible values are AZFW_Hub and AZFW_VNet."
  type        = string
  default     = "AZFW_VNet"
}

variable "firewall_sku_tier" {
  description = "SKU tier of the Firewall. Possible values are Standard and Premium."
  type        = string
  default     = "Standard"
}