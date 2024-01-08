variable "example_map"{
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






