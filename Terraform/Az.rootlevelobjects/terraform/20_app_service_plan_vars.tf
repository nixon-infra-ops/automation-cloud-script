locals {
  planname = "${var.resource_type_appserviceplan}-${var.concat_company}-${var.concat_department}-${var.concat_projectname}-${var.concat_environment}-${var.resource_instancecounter}"
}


variable "plan_os_type" {
  description = "The Operating system for the App Plan"
  type        = string
  default     = "Linux"
}

variable "plan_sku_name" {
  description = "Plan SKU for App Plan"
  type        = string
  default     = "P1v2"
}
