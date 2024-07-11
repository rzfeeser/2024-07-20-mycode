# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# create a resource group with the label "rg"
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name                      # provided by input variable
  location = var.build_location               # provided by input variable
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vm_net_name
  address_space       = ["10.0.0.0/16"]
  location            = var.build_location
  resource_group_name = azurerm_resource_group.rg.name
}


# this is now an "input" value
variable "build_location" {
  type = string
  default = "westus2"
}

# this is now an "input" value
variable "rg_name" {
  type = string
  default = "myAzureRG"
}

variable "vm_net_name" {
   type = string
   default = "myTFVnet"
}

output "net_scope" {
  value = azurerm_virtual_network.vnet.address_space
}
