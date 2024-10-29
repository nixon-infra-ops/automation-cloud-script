locals {
  acrname = "${var.resource_type_containerregistry}${var.concat_company}${var.concat_department}${var.concat_projectname}${var.resource_instancecounter}"
}

variable "acr_sku_name" {
  description = "SKU for Container Registry"
  type        = string
  default     = "Standard"
}
