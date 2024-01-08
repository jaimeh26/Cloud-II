resource "azurerm_service_plan" "mcitsp2" {
  name                = "${var.prefix}service_plan"
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  os_type             = "Windows"
  sku_name            = "P1v2"
}
locals{ 
  subnet_ids2=["subnet1","subnet2"]
}
resource "azurerm_windows_web_app" "mcit_windows" {
  for_each            = {for subnet_id in local.subnet_ids: subnet_id=>subnet_id}
  name                = "${var.prefix}windows-web-app"
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  service_plan_id     = azurerm_service_plan.mcitsp2.id
  

  site_config {}
}
