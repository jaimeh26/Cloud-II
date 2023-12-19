resource "azurerm_resource_group" "mcit420zz5um" {
  name     = "mcit_resource_group_420-ZZ5-UM"
  location = "canadacentral"
}
resource "azurerm_storage_account" "mcitstorage" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.mcit420zz5um.name
  location                 = azurerm_resource_group.mcit420zz5um.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
