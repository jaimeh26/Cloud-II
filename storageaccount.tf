resource "azurerm_storage_account" "mcit" {
  count                    = 5
  name                     = "${var.first_name}mcit${var.last_name}${count.index}"
  resource_group_name      = azurerm_resource_group.mcit420zz5um.name
  location                 = azurerm_resource_group.mcit420zz5um.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  cross_tenant_replication_enabled = false

  tags = {
    environment = "staging"
  }
}
