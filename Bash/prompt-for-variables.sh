#!/bin/bash

# Define the array
TemplateList=(
  "KII.Platform.Template.ClassLibrary.UI.NET8"
  "KII.Platform.Template.ClassLibrary.Utility.NET8"
  "KII.Platform.Template.CommonWebApi.MONGODB.NET8"
  "KII.Platform.Template.CommonWebApi.SQLDAPPER.NET8"
  "KII.Platform.Template.HostedBlazor.MONGODB.NET8"
  "KII.Platform.Template.HostedBlazor.SQLDAPPER.NET8"
)

TemplateName=
DotNewOptions=
DotNewTemplateOptions=
ProjectName=
ProjectDescription=
AZURE_DEVOPS_PAT=
DryRun=false

# Loop through arguments and assign values
while [[ $# -gt 0 ]]; do
  case "$1" in
    -t|--template-name)
      TemplateName="$2"
      shift 2
      ;;
    --dotnet-new-options)
      DotNewOptions="$2"
      shift 2
      ;;
    --dotnet-new-template-options)
      DotNewTemplateOptions="$2"
      shift 2
      ;;
    -p|--project-name)
      ProjectName="$2"
      shift 2
      ;;
    --project-description)
      ProjectDescription="$2"
      shift 2
      ;;
    --pat)
      AZURE_DEVOPS_PAT="$2"
      shift 2
      ;;
    --dry-run)
      DryRun=true
      echo "Dry-run mode enabled. Project and repo creation will be skipped."
      echo
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# If TemplateName is empty, prompt user
if [[ -z "$TemplateName" ]]; then
  # Display the array elements with a numbered list
  echo "Please choose a template:"
  for i in "${!TemplateList[@]}"; do
    echo "$((i+1))) ${TemplateList[$i]}"
  done

  # Prompt the user to choose a number
  read -p "Enter the number of your choice: " choice

  # Validate the input and retrieve the corresponding template
  if [[ $choice -gt 0 && $choice -le ${#TemplateList[@]} ]]; then
    TemplateName=${TemplateList[$((choice-1))]}
    echo "You have selected: $TemplateName"
  else
    echo "Invalid choice. Please try again."
  fi
fi





echo "Debug 001"
echo

if [[ -z "$DotNewOptions" ]]; then
  # Prompt the user for a Dot New Options
  read -p "Enter DotNewOptions: " DotNewOptions
  DotNewOptions=${DotNewOptions:""}
fi

echo "Debug 002: DotNewOptions=$DotNewOptions"
echo

if [[ -z "$DotNewTemplateOptions" ]]; then
  # Prompt the user for a Project Name
  read -p "Enter DotNewTemplateOptions: " DotNewTemplateOptions
  DotNewTemplateOptions=${DotNewTemplateOptions:""}
fi

echo "Debug 003: DotNewTemplateOptions=$DotNewTemplateOptions"
echo




if [[ -z "$ProjectName" ]]; then
  # Prompt the user for a Project Name
  read -p "Enter ProjectName [Default: Dev.MKH.Demo123]: " ProjectName
  ProjectName=${ProjectName:-Dev.MKH.Demo123}
fi

if [[ -z "$ProjectDescription" ]]; then
  # Prompt the user for a Project Description
  read -p "Enter ProjectDescription [Default: Description of your project]: " ProjectDescription
  ProjectDescription=${ProjectDescription:-"Description of your project"}
fi

if [[ -z "$AZURE_DEVOPS_PAT" ]]; then
  # Prompt the user for an Azure DevOps PAT
  read -p "Enter Azure DevOps PAT (hidden) [Default: ***hidden***]: " -s AZURE_DEVOPS_PAT
  AZURE_DEVOPS_PAT=${AZURE_DEVOPS_PAT:-"s5xuxvtv7nmyfuqpbgkxb3toyic6ek46ukkmj4knj322lxlaxkfa"}
  echo # Ensure a new line after silent input
fi

# Write the variables to a file (variables.sh)
cat <<EOF > ./variables.sh
#!/bin/bash
# Any changes to this file will be overwritten
# Please make changes to the runner.sh file

# These variables were set by the user
TemplateName="$TemplateName"
ProjectName='$ProjectName'
ProjectDescription='$ProjectDescription'
AZURE_DEVOPS_PAT='$AZURE_DEVOPS_PAT'
DryRun='$DryRun'
DotNewTemplateOptions='$DotNewTemplateOptions'

# These are static values that do not change too often
DevOpsBaseRUL="https://dev.azure.com"
DevOpsOrganizationName="KII-SoftwareDevOps"
ProjectBasePath='/mnt/c/source/crazypath'
ProjectVisibility=private

# Derived values
AUTH_HEADER=$(printf ":${AZURE_DEVOPS_PAT}" | base64)
ProjectFullPath="\$ProjectBasePath/\$ProjectName"
OrgBaseURL="https://dev.azure.com/\$DevOpsOrganizationName"
GitRemotePath="\$OrgBaseURL/\$ProjectName/_git/\$ProjectName"

DotNewOptions='--name "$ProjectName" --output "$ProjectName" $DotNewOptions '
EOF

source ./variables.sh

echo
echo "*** Dump the variables for logging purposes ***"
echo
echo '$TemplateName == '$TemplateName
echo '$ProjectName == '$ProjectName
echo '$ProjectDescription == '$ProjectDescription
echo '$AZURE_DEVOPS_PAT == *** (hidden) ***'
echo '$DryRun == '$DryRun
echo
echo '$DevOpsBaseRUL == '$DevOpsBaseRUL
echo '$DevOpsOrganizationName == '$DevOpsOrganizationName
echo '$ProjectBasePath == '$ProjectBasePath
echo '$ProjectVisibility == '$ProjectVisibility
echo
echo '$AUTH_HEADER == '$AUTH_HEADER
echo '$ProjectFullPath == '$ProjectFullPath
echo '$OrgBaseURL == '$OrgBaseURL
echo '$GitRemotePath == '$GitRemotePath

echo '$DotNewOptions == '$DotNewOptions
echo '$DotNewTemplateOptions == '$DotNewTemplateOptions
echo

return 0
