locals{
  characters = ["luke", "yoda", "darth"]
  enemies_destroyed = [4252, 900, 20000056894]
  }
}

output "character_mapping"{
value={for index,character in local.characters:
      character => local.enemies_destroyed[index]
}
