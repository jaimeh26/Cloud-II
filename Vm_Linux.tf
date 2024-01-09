resource "azurerm_service_plan" "mcitsp" {
  name                = "${var.prefix}service_plan"
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}
locals{ 
  subnet_ids=["subnet1","subnet2"]
}
resource "azurerm_linux_web_app" "mcit_linux" {
  count               = 5
  for_each            = {for subnet_id in local.subnet_ids: subnet_id=>subnet_id}
  name                = "${var.prefix}linux-web-app"${count.index}
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  service_plan_id     = azurerm_service_plan.mcitsp.id
  

  site_config {}
}
