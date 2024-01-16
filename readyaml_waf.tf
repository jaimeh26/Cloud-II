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
