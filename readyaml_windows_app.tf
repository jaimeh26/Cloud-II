provider "azurerm" {
  features {}
}

locals{
  windowsconfig=[for f in fileset("${path.module}/windows_app_config", "[^_]*.yaml") : yamldecode(file("${path.module}/windows_app_config/${f}"))]
  windows_apps = flatten([
    for app in local.windowsconfig : [
      for windowsapp in try(app.windowsfunctionapp, []) :{
        name: windowsapp.name
        account_tier: windowsapp.account_tier
        account_replication_type: windowsapp.account_replication_type
        os_type: windowsapp.os_type
        sku_name: windowsapp.sku_name    
      }
    ]
])
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}
