#module for Ressource Group

variable "ressource_group_name" {
    description = "The name of the Azure Ressource Group"
}

variable "location" {
    description = "The Azure region where the Ressource Group will be created"
    default     = "eastus"
}

resource "azurerm_ressource_group" "example" {
  name     = var.ressource_group_name
  location = var.location
}

output "ressource_group_id" {
  value = azurerm_ressource_group.example.id
}

output "ressource_group_name" {
  value = azurerm_ressource_group.example.name
}

output "ressource_group_location" {
  value = azurerm_ressource_group.example.location
}
