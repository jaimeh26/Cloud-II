locals{
  storage_account = [for f in fileset("${path.module}/storageaccountconfig", "[^_]*.yaml") : yamldecode(file("${path.module}/storageaccountconfig/${f}"))]
  storage_account_list = flatten([
    for storage_account in local.storage_account : [
      for storageaccounts in try(storage.listofstorageaccount, []) :{
        name = storageaccounts.name
        account_tier = storageaccounts.account_tier
        account_replication_type = storageaccounts.account_replication_type
        access_tier = storageaccounts.access_tier
        cross_tenant_replication_enabled = storageaccounts.cross_tenant_replication_enabled
        
      }
    ]
])
}
