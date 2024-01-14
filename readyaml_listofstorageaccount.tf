locals{
  storage_account=[for f in fileset("${path.module}/configs", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/${f}"))]
  storage_account_list = flatten([
    for storage_account in local.storage_account : [
      for storageaccounts in try(storageaccount.listofstorageaccount, []) :{
        name=listofstorageaccounts.name
        account_tier=listofstorageaccounts.account_tier
        account_replication_type=listofstorageaccounts.account_replication_type
        access _tier=listofstorageaccounts.access_tier
        cross_tenant_replication_enabled=listofstorageaccounts.cross_tenant_replication_enabled
        
      }
    ]
])
}
