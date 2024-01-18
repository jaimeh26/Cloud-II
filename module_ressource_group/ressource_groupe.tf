#module for storage account

variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The Azure region where the storage account will be created"
  default     = "eastus"
}

