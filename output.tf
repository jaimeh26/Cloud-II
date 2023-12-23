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
