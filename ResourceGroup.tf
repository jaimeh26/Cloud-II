resource "azurerm_resource_group" "mcit420zz5um" {
  name     = "mcit_resource_group_420-ZZ5-UM"
  location = "canadacentral"
}
resource "azurerm_storage_account" "mcitstorage" {
  name                     = "storageaccountname-${var.countnumber}"
  resource_group_name      = azurerm_resource_group.mcit420zz5um.name
  location                 = azurerm_resource_group.mcit420zz5um.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  cross_tenant_replication_enabled = false

  tags = {
    environment = "staging"
  }
}
resource "azurerm_mssql_server" "mcitdb" {
  name                         = "example-sqlserver"
  resource_group_name          = azurerm_resource_group.mcit420zz5um.name
  location                     = azurerm_resource_group.mcit420zz5um.location
  version                      = "12.0"
  administrator_login=var.administrator_login

  administrator_login_password=var.administrator_login_password
}
resource "azurerm_mssql_database" "mcitdb" {
  name           = "example-db"
  server_id      = azurerm_mssql_server.mcitdb.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true
  enclave_type   = "VBS"
  
  tags = {
    foo = "bar"
  }
  }
