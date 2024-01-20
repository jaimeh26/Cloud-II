provider "azurerm" {
  features {}
}

locals{
  windowsconfig=[for f in fileset("${path.module}/windows_app_config", "[^_]*.yaml") : yamldecode(file("${path.module}/windows_app_config/${f}"))]
  windows_apps = flatten([
    for app in local.windowsconfig : [
      for windowsapps in try(app.windowsfunctionapp, []) :{
        name=linuxapps.name
        os_type=linuxapps.os_type
        sku_name=linuxapps.sku_name     
      }
    ]
])
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}
