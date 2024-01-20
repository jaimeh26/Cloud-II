provider "azurerm" {
  features {}
}

locals{
  windowsconfig=[for f in fileset("${path.module}/windows_app_config", "[^_]*.yaml") : yamldecode(file("${path.module}/windows_app_config/${f}"))]
  linux_app_list = flatten([
    for app in local.windowsconfig : [
      for linuxapps in try(app.listoflinuxapp, []) :{
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
