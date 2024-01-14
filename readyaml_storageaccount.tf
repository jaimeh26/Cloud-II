locals{
  storage_account = [for f in fileset("${path.module}/storageaccountconfig", "[^_]*.yaml") : yamldecode(file("${path.module}/storageaccountconfig/${f}"))]
  storage_account_list = flatten([
    for storage_account in local.storage_account : [
      for storageaccounts in try(storage.listofstorageaccount, []) :{
        name = listofstorageaccounts.name
        account_tier = listofstorageaccounts.account_tier
        account_replication_type = listofstorageaccounts.account_replication_type
        access_tier = listofstorageaccounts.access_tier
        cross_tenant_replication_enabled = listofstorageaccounts.cross_tenant_replication_enabled
        
      }
    ]
])
}
