module "ressource_group" {
  source = "./module_ressource_group/"

  ressource_group_name   = "myressourcegroup"
  location              = "eastus"
  
}

output "ressource_group_name" {
  value = module.ressource_group.ressource_group_name
}

output "ressource_group_id" {
  value = module.ressource_group.ressource_group_id
}
