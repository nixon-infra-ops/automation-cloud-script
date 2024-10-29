###############################################################################
# 
###############################################################################

########################################################################################
#  Constants -- START
########################################################################################
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

variable "resource_type_azuresqldatabase" {
  description = "Abbreviation for Azure SQL Database instance"
  type        = string
  default     = "sqldb"
}

variable "resource_type_appserviceplan" {
  description = "Abbreviation for App Service plan"
  type        = string
  default     = "plan"
}

variable "resource_type_webapp" {
  description = "Abbreviation for Web app"
  type        = string
  default     = "app"
}

variable "resource_type_application_insights" {
  description = "Abbreviation for Application Insights"
  type        = string
  default     = "appi"
}

variable "resource_type_storageaccounts" {
  description = "Abbreviation for Storage Account"
  type        = string
  default     = "st"
}

variable "resource_type_keyvault" {
  description = "Abbreviation for Key Vault"
  type        = string
  default     = "kv"
}
########################################################################################
#  Constants -- END
########################################################################################

########################################################################################
# Configurable variables depending the application - START
########################################################################################
variable "resource_instancecounter" {
  description = "Instance Counter to be used for suffix. This should be a three digit string.  001, 002 etc."
  type        = string
}

variable "concat_company" {
  description = "Company abbreviation to be used when creating azure resources"
  type        = string
}

variable "concat_department" {
 description = "Department abbreviation to be used when creating azure resources"
 type        = string
}

variable "concat_projectname" {
  description = "Project long name"
  type        = string
}

variable "concat_projectshortname" {
  description = "Project short name"
  type        = string
}

variable "resource_location" {
  description = "Resource location"
  type        = string
}

variable "concat_environment" {
  description = "Subscription Indicator"
  type        = string
}

variable "concat_app_service_tags" {
  description = "App Service Tags"
  type        = map(any)
}


########################################################################################
# Configurable variables depending the application - END
########################################################################################

#########################################################################
# App Service Plan Section - START
#########################################################################
variable "allocated_resource_group_for_appserviceplan" {
  description = "Resource Group Name of allocated App Service Plan"
  type        = string
}

# We will use a fixed value for "App Service Plan"
# All app service instance will have a common app service plan already created beforehand
# Creating one app service plan per application (app service) might be expensive
# Make sure to update "allocated_resource_group_for_app_service_plan" if this field is also updated
variable "allocated_app_service_plan_name" {
  description = "App Service Plan Name"
  type        = string
}
#########################################################################
# App Service Plan Section - END
#########################################################################


#########################################################################
# SQL Server Section - START
#########################################################################
variable "allocated_resource_group_for_sql" {
  description = "Resource Group Name where the dev sql server is under"
  type        = string
}
variable "allocated_mssql_database_name" {
  description = "SQL Server Name"
  type        = string
}

##############################################################################################


