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
variable "users"{
 type=list
 default=["jaime","sheila","mia"]
}
variable "canadianfoodlist"{
  type=list
  default=["poutine","smokemeat","patechinois","macaroni","salmon","pizza","hotdog","steak","lasagna"]
}
variable "numbersfromonetoten"{
  type=list
  default=[1,2,3,4,5,6,7,8,9,10]
}
variable "first_name" {
  description = "First name for naming convention"
  type        = string
  default     ="jaime"
}

variable "last_name" {
  description = "Last name for naming convention"
  type        = string
  default     ="jaramillo"
}
variable "storage_account_count" {
  description = "Number of storage accounts to create"
  type        = number
  default     = 5
}
variable "prefix"{
 type=string
 default="mcit"
}
variable "simple_nested_list" {
  type = list(list(string))
  default = [["a", "b"], ["c", "d"}, ["e"], ["f"]]
}

  
