resource "azurerm_service_plan" "mcitsp" {
  name                = "${var.prefix}service_plan"
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "mcit_linux" {
  name                = "${var.prefix}linux-web-app"
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  service_plan_id     = azurerm_service_plan.mcitsp.id
  virtual_network_subnet_id = azure_virtual_network.mcitvn["subnet2"].id

  site_config {}
}
