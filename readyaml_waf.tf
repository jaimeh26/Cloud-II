locals{
  wafapp=[for f in fileset("${path.module}/waf_configs, "[^_]*.yaml") : yamldecode(file("${path.module}/waf_config/${f}"))]
  waf_app_list = flatten([
    for app in local.wafapp : [
      for wafapps in try(app.listofwafapp, []) :{
        name=wafapps.name
        resource_group_name = azurerm_resource_group.mcit420zz5um.name
        location            = azurerm_resource_group.mcit420zz5um.location
             
      }
    ]
])
}
