##  Constants -- START
variable "resource_type_resourcegroup" {
  description = "Abbreviation for Resource group"
  type        = string
  default     = "rg"
}

variable "resource_type_azuresqlserver" {
  description = "Abbreviation for Azure SQL Database server"
  type        = string
  default     = "sql"
}

variable "resource_type_appserviceplan" {
  description = "Abbreviation for App Service plan"
  type        = string
  default     = "plan"
}

variable "resource_type_containerregistry" {
  description = "Abbreviation for Container Registry"
  type        = string
  default     = "acr"
}

variable "resource_type_keyvault" {
  description = "Abbreviation for App Service plan"
  type        = string
  default     = "kv"
}


variable "resource_type_storageaccounts" {
  description = "Abbreviation for Storage Account"
  type        = string
  default     = "st"
}

variable "resource_instancecounter" {
  description = "Instance Counter to be used for suffix. This should be a three digit string. 001, 002 etc."
  type        = string
}
#  Constants -- END

# Configurable variables depending the application
variable "concat_company" {
  description = "Company abbreviation to be used when creating azure resources"
  type        = string
  default     = "kii"
}

variable "concat_department" {
  description = "Department abbreviation to be used when creating azure resources"
  type        = string
  default     = "es" # TODO: Change
}

variable "concat_projectname" {
  description = "Project long name"
  type        = string
  default     = "rootlevelobjects" # TODO: Change
}

variable "concat_environment" {
  description = "Environment"
  type        = string
}

variable "concat_projectshortname" {
  description = "Project short name"
  type        = string
  default     = "rootobj" # TODO: Change
}

variable "resource_location" {
  description = "Resource location"
  type        = string
  default     = "westus2"
}

variable "concat_app_service_tags" {
  description = "App Service Tags"
  type        = map(any)
}


# These are sql ad admin security group information
# we define these in the common vars because the
# security group will be the same for all database
# servers.
variable "sqlserver_ad_login" {
  description = "The AD Security Group"
  type        = string
}

variable "sqlserver_ad_login_objid" {
  description = "The AD Object Id"
  type        = string
}











