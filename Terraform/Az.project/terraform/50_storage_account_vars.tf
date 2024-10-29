
locals {
  storageaccountname = "${var.resource_type_storageaccounts}${var.concat_company}${var.concat_department}${var.concat_projectshortname}${var.concat_environment}"
}

#stkiiesmediasrvc

variable "storageaccount_account_tier" {
  description = "The Storage Account tier"
  type        = string
  default     = "Standard"
}

variable "storageaccount_account_replication_type" {
  description = "The Storage Account replication type"
  type        = string
  default     = "LRS"
}
