variable "subscription_id"{
  type=string
}

variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}
variable "administrator_login"{
  type=string
}
variable "administrator_login_password"{
  type=string
}
variable "countNumber"{
  type=number
  default=0
}
variable "account_tier"{
  type=string
  default="Standard"
}
variable "myname"{
  type=string
}
variable "account_replication_type"{
  type=string
  default="GRS"
}
variable "access_tier"{
  type=string
  default="Cool"
}
variable "cross_tenant_replication_enabled"{
 type=bool
 default=false
}
variable "component"{
  type    = list
  default = ["bastion", "frontproxy", "db", "infra"]
}
variable "environment"{
  type=string
  default="staging"
}
variable "environment"{
 type=string
 default="staging"
}
