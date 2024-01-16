locals{
  waf_policy=[for f in fileset("${path.module}/waf_config", "[^_]*.yaml") : yamldecode(file("${path.module}/waf_config/${f}"))]
  azurewafpolicy_list = flatten([
    for app in local.waf_policy: [
      for azurewaf in try(app.listofwafpolicy, []) :{
        name=azurewaf.name
      }
    ]
])
}
