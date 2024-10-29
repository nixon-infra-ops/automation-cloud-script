#!/bin/bash

source ./variables.sh

echo
echo "Creating Azure DevOps Project: $ProjectName"
echo

OrgURL="$DevOpsBaseRUL/$DevOpsOrganizationName"

# Set default organization
echo "Setting default organization to $OrgURL"
az devops configure --defaults organization="$OrgURL"

# Step 1: Create a DevOps project
echo "Creating Azure DevOps: ProjectName == $ProjectName"

az devops project create \
--name $ProjectName \
--description "$ProjectDescription" \
--organization "$OrgURL" \
--visibility "$ProjectVisibility"
# Show devops project before creating
az devops project show --organization "$OrgURL" --project $ProjectName

# Step 2: Disable Azure Boards
# REST API to disable Boards
# echo "Disabling Azure Boards for the project..."

# curl -u ":$AZURE_DEVOPS_PAT" \
#      -X PATCH \
#      -H "Content-Type: application/json" \
#      -d '{"state": 0}' \
#      "$OrgURL/$ProjectName/_apis/FeatureManagement/FeatureStates/ms.vss-work.agile?api-version=6.0-preview.1"

# echo "Azure Boards disabled successfully!"
