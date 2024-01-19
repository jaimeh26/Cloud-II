variable "nested_map2" {
  type    = map(map(string))
  default = {
    group1 = {"name" = "Bob", "age" = "25"}
    group2 = {"name" = "Alice", "age" = "30"}
  }
}
locals{
 flattened_map  = flatten([for k, v in var.nested_map : [for kk, vv in v : { group = k, key = kk, value = vv }]])
   }
output "flattened_map_result" {
  value = local.flattened_map
}
