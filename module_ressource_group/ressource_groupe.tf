#module for Ressource Group

variable "resource_group_name" {
    description = "The name of the Azure Resource Group"
}

variable "location" {
    description = "The Azure region where the Resource Group will be created"
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}
