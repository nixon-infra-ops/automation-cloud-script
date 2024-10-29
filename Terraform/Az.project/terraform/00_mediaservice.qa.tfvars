
concat_company = "kii"

concat_department = "es"

concat_projectname = "mediaservice"

concat_projectshortname = "mediasrv"

resource_location = "westus2"

resource_instancecounter = "001"

concat_environment = "qa"

concat_app_service_tags = {
  "Owner" : "Caleb Johnson"
  "Developer" : "Gervel Giva"
  "Cost Center" : "802730"
  "Application" : "MediaService"
  "Environment" : "QA"
}

#########################################################################
# App Service Plan Section - START
#########################################################################
allocated_resource_group_for_appserviceplan = "rg-kii-es-rootlevelobjects-qa"
allocated_app_service_plan_name             = "plan-kii-es-rootlevelobjects-qa-001"
#########################################################################
# App Service Plan Section - END
#########################################################################

#########################################################################
# SQL Server Section - QA - START
#########################################################################
allocated_resource_group_for_sql = "rg-kii-es-rootlevelobjects-qa"
allocated_mssql_database_name   = "sql-kii-es-rootlevelobjects-qa-001"
#allocated_mssql_database_name_stage="dbsrv-kii-azsql-kplat-stage-001"
#########################################################################
# SQL Server Section - QA - END
#########################################################################
