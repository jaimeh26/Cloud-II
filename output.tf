output "print"{
      value = local.service_name
}
output "secondprint"{
      value = local.owner
}
output "thirdprint"{
      value = local.location
}
output "fourthprint"{
      value=local.lengthofservice_name
}
output "fifthprint"{
      value=local.getthelength
}
output "countNumber"{
      value=var.countNumber
}
output "wintersports"{
    value=[for sport in local.wintersports:sport]
}
output "canadianfoodlist"{
      value=[for food in local.canadianfoodlist:food]
}
output "numbersfromonetoten"{
      value=[for number in local.numbersfromonetoten:number]
}
output "sumoftennumbers"{
      value=sum([for numberoutput in local.total_output: numberoutput])
}
output "canadianfoodlist2"{
      value=var.canadianfoodlist
}
output "numbersfromonetoten2"{
      value=var.numbersfromonetoten
}
output "sumoftennumbers2"{
      value=sum([for numberoutput in local.total_output2: tonumber(numberoutput)])
}
output "storage_account_names" {
  value = [for storage_account in azurerm_storage_account.mcit : storage_account.name]
}

