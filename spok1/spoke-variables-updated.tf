# spoke/variables.tf

variable "location" {
  description = "The Azure region where the spoke resources will be created"
  type        = string
}

variable "spoke_resource_group_name" {
  description = "The name of the resource group for the spoke"
  type        = string
}

variable "spoke_vnet_name" {
  description = "The name of the spoke virtual network"
  type        = string
}

variable "spoke_vnet_address_space" {
  description = "The address space for the spoke virtual network"
  type        = list(string)
}

variable "spoke_subnet_prefix" {
  description = "The address prefix for the spoke subnet"
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

variable "hub_vnet_name" {
  description = "The name of the hub virtual network"
  type        = string
}

variable "hub_resource_group_name" {
  description = "The name of the resource group for the hub"
  type        = string
}
