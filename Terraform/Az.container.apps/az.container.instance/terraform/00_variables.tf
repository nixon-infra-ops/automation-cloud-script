# variables.tf

variable "name" {
  description = "The name of the container app"
  type        = string
}

variable "kvname" {
  description = "The name of the container app"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
}

variable "revision_mode" {
  description = "The revision mode for the container app"
  type        = string
  default     = "Single"
}

variable "container_name" {
  description = "The name of the container"
  type        = string
  default     = "examplecontainerapp"
}

variable "container_image" {
  description = "The image of the container"
  type        = string
  default     = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
}

variable "container_cpu" {
  description = "The CPU allocation for the container"
  type        = number
  default     = 0.25
}

variable "container_memory" {
  description = "The memory allocation for the container"
  type        = string
  default     = "0.5Gi"
}

variable "concat_app_service_tags" {
  description = "App Service Tags"
  type        = map(any)
}


variable "allocated_container_app_environment_name" {
  description = "The name of the existing Azure Container Apps environment."
  type        = string
}

variable "allocated_resource_group_for_container_environment" {
  description = "The name of the existing resource group for Azure Container Apps environment."
  type        = string
}

