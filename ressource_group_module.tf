module "ressource_group" {
  source = "./module_ressource_group/"

  resource_group_name   = "myresourcegroup"
  location              = "eastus"
  
}

output "ressource_group_name" {
  value = module.resource_group.ressource_group_name
}

output "ressource_group_id" {
  value = module.ressource_group.ressource_group_id
}
