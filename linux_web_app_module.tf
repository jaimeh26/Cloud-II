module "example" {
  source               = "./module_linux_web_app"
  resource_group_name = "example-resources"
  location            = "West Europe"
  service_plan_name   = "example"
  web_app_name        = "example"
}
