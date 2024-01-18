module "ressource_group" {
  source = "./module_ressource_group/"

  resource_group_name   = "myresourcegroup"
  location              = "eastus"
  
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}
