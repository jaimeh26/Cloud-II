module "ressource_group" {
  source = "./module_ressource_group/"

  resource_group_name   = "myresourcegroup"
  location              = "eastus"
  
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "resource_group_id" {
  value = module.resource_group.resource_group_id
}
