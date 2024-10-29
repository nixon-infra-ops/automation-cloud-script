#!/bin/bash

# Variables
OrgURL="https://vssps.dev.azure.com/KII-SoftwareDevOps"
ProjectName="$ProjectName"
PAT='s5xuxvtv7nmyfuqpbgkxb3toyic6ek46ukkmj4knj322lxlaxkfa'

# Name of the custom group
PredefinedGroupName="[KII-SoftwareDevOps]\\\\KII-Team-DevOps"
echo "PredefinedGroupName ID: $PredefinedGroupName"

# Step 1: Get the Project ID
ProjectID=$(curl -u ":$PAT" \
  -H "Content-Type: application/json" \
  "https://dev.azure.com/KII-SoftwareDevOps/_apis/projects?api-version=6.0" \
  | jq -r ".value[] | select(.name==\"$ProjectName\") | .id")

echo "Project ID: $ProjectID"

# Step 2: List all graph groups and find the group descriptor
echo "Fetching the group descriptor for $PredefinedGroupName..."

GroupDescriptor=$(curl -u ":$PAT" \
  -H "Content-Type: application/json" \
  "https://vssps.dev.azure.com/KII-SoftwareDevOps/_apis/graph/groups?api-version=6.0-preview.1" \
  | jq -r ".value[] | select(.principalName==\"$PredefinedGroupName\") | .descriptor")

echo "Group Descriptor: $GroupDescriptor"

# Step 3: Get the Default Team for the Project
echo "Fetching the default team for the project..."
TeamID=$(curl -u ":$PAT" \
  -H "Content-Type: application/json" \
  "https://dev.azure.com/KII-SoftwareDevOps/_apis/projects/$ProjectID/teams?api-version=6.0" \
  | jq -r ".value[] | select(.name==\"$ProjectName Team\") | .id")

echo "Default Team ID: $TeamID"

# Step 4: Add the Custom Group to the Default Project Team
echo "Adding the custom group to the default project team..."
curl -u ":$PAT" \
  -X POST \
  -H "Content-Type: application/json" \
  -d "{\"principalDescriptor\": \"$GroupDescriptor\"}" \
  "https://dev.azure.com/KII-SoftwareDevOps/_apis/projects/$ProjectID/teams/$TeamID/memberships?api-version=6.0"

echo "Custom group $PredefinedGroupName added to the default project team!"

curl -u ":$PAT" \
  -X POST \
  -H "Content-Type: application/json" \
  -d "{\"principalDescriptor\": \"vssgp.Uy0xLTktMTU1MTM3NDI0NS0zNTY5ODA4MzYwLTM2NDY5OTc4MzQtMjIwNjI5NjQ5Ni0xMzA5NTYyNzI4LTEtMjEwNTM3NTkzOS0xOTE1ODQ0MTYzLTIxNTYyNTY4MjktMTg2NDA5MDUyMg\"}" \
  "https://dev.azure.com/KII-SoftwareDevOps/_apis/projects/308470ff-2321-412d-8041-8f2be61a8547/teams/a3a729f6-a353-414a-a327-c30c86e0a072/memberships?api-version=6.0"
  "https://dev.azure.com/KII-SoftwareDevOps/_apis/projects/{ProjectID}/teams/{TeamID}/memberships?api-version=6.0"

curl -u ":$PAT" \
  -H "Content-Type: application/json" \
  "https://vssps.dev.azure.com/KII-SoftwareDevOps/_apis/graph/users?api-version=6.0-preview.1" \
  | jq -r 

  GroupDescriptor=$(curl -u ":$PAT" \
  -H "Content-Type: application/json" \
  "https://vssps.dev.azure.com/KII-SoftwareDevOps/_apis/graph/groups?api-version=6.0-preview.1" \
  | jq -r ".value[] | select(.principalName==\"$PredefinedGroupName\") | .descriptor")

echo "Group Descriptor: $GroupDescriptor"


PATCH https://dev.azure.com/{organization}/_apis/projects/{projectId}/properties?api-version=7.2-preview.1

GET https://dev.azure.com/KII-SoftwareDevOps/_apis/projects/308470ff-2321-412d-8041-8f2be61a8547?api-version=7.2-preview.4

curl -u ":$PAT" \
  -X GET \
  "https://dev.azure.com/KII-SoftwareDevOps/_apis/projects/308470ff-2321-412d-8041-8f2be61a8547?api-version=7.2-preview.4" \
  | jq -r 
