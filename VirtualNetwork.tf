resource "azurerm_network_security_group" "mcitvn" {
  name                = "${var.prefix}security_group"
  location            = azurerm_resource_group.mcit420zz5um.location
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
}
