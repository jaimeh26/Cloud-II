resource "azurerm_network_security_group" "mcitsg" {
  name                = "${var.prefix}security_group"
  location            = azurerm_resource_group.mcit420zz5um.location
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
}
locals{ 
  vnet_names=["vnet-jaime1","vnet-jaime2","vnet-jaime3","vnet-jaime4"]
}
resource "azurerm_virtual_network" "mcitvn" {
  for_each            = {for vnet in local.vnet_names: vnet=>vnet}
  name                = "${var.prefix}${each.key}-vnet"
  location            = azurerm_resource_group.mcit420zz5um.location
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.mcitsg.id
  }

  tags = {
    environment = "Production"
  }
}
