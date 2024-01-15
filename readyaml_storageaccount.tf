locals{
  storageaccounts=[for f in fileset("${path.module}/configs/storageaccountconfig", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/storageaccountconfig/${f}"))]
  storageaccountlist = flatten([
    for info in local.storageaccounts : [
      for storageaccount in try(info.listofstorageaccount, []) :{
        name=storageaccount.name
        account_tier=storageaccount.account_tier
        account_replication_type=storageaccount.account_replication_type
        access_tier=storageaccount.access_tier
        cross_tenant_replication_enabled=storageaccount.cross_tenant_replication_enabled
        
      }
    ]
])
}
resource "azurerm_storage_account" "readyaml_storageaccount" {
  for_each            ={for sa in local.storageaccountlist: "${sa.name}"=>sa }
  name                = each.value.name
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
        account_tier=each.value.account_tier
        account_replication_type=each.value.account_replication_type    
  tags = {
    environment = "staging"
  }
}

output "storageaccount_list_yaml" {
 value = local.storageaccountlist
}
