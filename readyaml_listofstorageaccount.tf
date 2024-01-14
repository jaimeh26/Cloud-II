locals{
  storage_account=[for f in fileset("${path.module}/configs", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/${f}"))]
  storage_account_list = flatten([
    for storage_account in local.storage_account : [
      for storageaccounts in try(app.listofstorageaccount, []) :{
        name=linuxapps.name
        os_type=linuxapps.os_type
        sku_name=linuxapps.sku_name     
      }
    ]
])
}
