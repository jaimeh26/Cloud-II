/*module "example" {
  source               = "./module_linux_web_app"
  resource_group_name = "example-resources"
  location            = "eastus"
  service_plan_name   = "example"
  web_app_name        = "example"
}

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "service_plan_id" {
  value = azurerm_service_plan.example.id
}

output "web_app_id" {
  value = azurerm_linux_web_app.example.id
}
*/
