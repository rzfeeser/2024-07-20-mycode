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

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.loc
}

# this is now an "input" value 
variable "loc" {
  type    = string
  default = "westus2"
}

variable "rg_name" {
  type = string
  default = "myTFResourceGroup"
}
