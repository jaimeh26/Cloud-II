#module for Resource Group

variable "resource_group_name" {
    description = "The name of the Azure Resource Group"
}

variable "location" {
    description = "The Azure region where the Resource Group will be created"
    default     = "eastus"
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "resource_group_location" {
  value = azurerm_resource_group.example.location
}
