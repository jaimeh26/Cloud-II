resource "azurerm_resource_group" "example" {
  name     = "LoadBalancerRG"
  location = "West Europe"
}
locals{
  waf_policy=[for f in fileset("${path.module}/waffolder", "[^_]*.yaml") : yamldecode(file("${path.module}/waffolder/${f}"))]
  azurewafpolicy_list = flatten([
    for app in local.waf_policy: [
      for azurewaf in try(app.listofwafpolicy, []) :{
        name=azurewaf.policyname
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
