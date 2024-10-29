
locals {
  sqldbname = "${var.resource_type_azuresqldatabase}-${var.concat_company}-${var.concat_department}-${var.concat_projectname}"
}

#  sqldb-kii-es-mediaservice

variable "sqldb_collation" {
  description = "Collation"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}
variable "sqldb_license_type" {
  description = "License Type"
  type        = string
  default     = "LicenseIncluded"
}
variable "sqldb_max_size_gb" {
  description = "Max Size (GB)"
  type        = number
  default     = 1
}
variable "sqldb_read_scale" {
  description = "Read Scale"
  type        = bool
  default     = false
}
variable "sqldb_sku_name" {
  description = "SKU Name"
  type        = string
  default     = "Basic"
}
variable "sqldb_zone_redundant" {
  description = "Zone Redundant"
  type        = bool
  default     = false
}
