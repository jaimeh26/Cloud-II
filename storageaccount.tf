resource "azurerm_storage_account" "mcit" {
  count                    = var.storage_account_count
  name                     = "${var.first_name}mcit${var.last_name}${count.index + 1}"
  resource_group_name      = azurerm_resource_group.mcit420zz5um.name
  location                 = azurerm_resource_group.mcit420zz5um.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  cross_tenant_replication_enabled = false

  tags = {
    environment = "staging"
  }
}
