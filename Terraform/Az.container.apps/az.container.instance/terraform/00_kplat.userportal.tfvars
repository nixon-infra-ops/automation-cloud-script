# Define the location of the resource group and container app environment

name                        = "ca-kii-es-userportal"
resource_group_name         = "rg-kii-es-userportal"
resource_group_location     = "West US 2"
revision_mode               = "Multiple"

container_name              = "kplatuserportalcontainerapp"
container_image             = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
container_cpu               = 0.25
container_memory            = "0.5Gi"
kvname                      = "kv-kii-es-userportal"

allocated_container_app_environment_name = "cae-kii-es-containerapps"

allocated_resource_group_for_container_environment = "rg-kii-es-containerapps"

                     

concat_app_service_tags = {
  "Business Owner" : "Caleb Johnson"
  "Developer" : "Arianne Briones"
  "Cost Center" : "802730"
  "Application" : "KPLAT User Portal"
  "Environment" : "Production"
}

