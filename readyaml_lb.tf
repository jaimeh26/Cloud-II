resource "azurerm_resource_group" "example" {
  name     = "LoadBalancerRG"
  location = "West Europe"
}
locals{
  allocation_method=[for f in fileset("${path.module}/lb_config", "[^_]*.yaml") : yamldecode(file("${path.module}/lb_config/${f}"))]
  azure_lb_list = flatten([
    for lb in local.azure_lb_list: [
      for azurelb in try(lb.listofallocationmethod, []) :{
        allocation_method=azurewaf.policyname
      }
    ]
])
}

resource "azurerm_public_ip" "example" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  }

resource "azurerm_lb" "example" {
  name                = "TestLoadBalancer"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}
