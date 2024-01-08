resource "azurerm_service_plan" "mcitsp" {
  name                = "${var.prefix}service_plan"
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "mcit_linux" {
  name                = "${var.prefix}linux_web_app"
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_service_plan.mcit420zz5um.location
  service_plan_id     = azurerm_service_plan.mcitsp.id

  site_config {}
}
