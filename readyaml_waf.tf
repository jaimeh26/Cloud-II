locals{
  waf_app=[for f in fileset("${path.module}/waf_configs, "[^_]*.yaml") : yamldecode(file("${path.module}/waf_config/${f}"))]
  waf_app_list= flatten([
    for app in local.waf_app : [
      for wafapps in try(app.listofwafapp, []) :{
        name=wafapps.name
              
      }
    ]
])
}
