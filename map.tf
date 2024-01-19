/*variable "example_map"{
  type=map(object({
  name=string
  enemies_destroyed = number
  badguy = bool
}))
default = {
  key1 = {
  name = "luke"
  enemies_destroyed = 4552
  badguy = false
}
key2 = {
  name = "yoda"
  enemies_destroyed = 900
  badguy = false
}
key3 = {
  name = "darth"
  enemies_destroyed = 20000056894
  badguy = true
}
}
}
output "print2"{
      value = var.example_map
}
variable "lightsabre_color_map"{
  type = map(list(string))
  default = {
  luke = ["green", "blue"]
  yoda = ["green"]
  darth = ["red"]
}
}
output "print3"{
  value = var.lightsabre_color_map
}

locals {
  characters = ["luke", "yoda", "dart"]
  enemies_destroyed = [4552, 900, 20000056894]
}
output "print4"{
value={for index,character in local.characters: # Convert character list to a set
      character => local.enemies_destroyed[index]
}
}
locals {
  alphabets=["a","b","c","d","e"]
  numbers=[1,2,3,4,5]
}
output "print5" {
  value = {for index,alphabet in local.alphabets: # Convert alphabet list to a set
  alphabet => local.numbers[index]
}
}
*/







