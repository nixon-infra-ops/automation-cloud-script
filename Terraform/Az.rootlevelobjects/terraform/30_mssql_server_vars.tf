
locals {
  sqlservername = "${var.resource_type_azuresqlserver}-${var.concat_company}-${var.concat_department}-${var.concat_projectname}-${var.concat_environment}-${var.resource_instancecounter}"
}

variable "sqlserver_version" {
  description = "The SQL Server version number"
  type        = string
  default     = "12.0"
}

variable "sqlserver_administrator_login" {
  description = "The SQL Server admin username"
  type        = string
  default     = "abc"
}

variable "sqlserver_administrator_login_password" {
  description = "The SQL Server admin password"
  type        = string
  sensitive   = true
  #default     = "abc"
}

