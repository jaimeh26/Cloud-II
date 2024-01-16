locals{
  lb_allocation=[for f in fileset("${path.module}/lb_config", "[^_]*.yaml") : yamldecode(file("${path.module}/lb_config/${f}"))]
  allocation_list = flatten([
    for lb in local.azure_lb_list: [
      for azurelb in try(lb.listofallocationmethod, []) :{
        allocation_method=azurelb.allocation_method
      }
    ]
])
}

resource "azurerm_resource_group" "example1" {
  name     = "LoadBalancerRG"
  location = "West Europe"
}

resource "azurerm_public_ip" "example1" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.example1.location
  resource_group_name = azurerm_resource_group.example1.name
  

resource "azurerm_lb" "example1" {
  name                = "TestLoadBalancer"
  location            = azurerm_resource_group.example1.location
  resource_group_name = azurerm_resource_group.example1.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.example1.id
  }
}
