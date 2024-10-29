#!/bin/bash

source ./variables.sh
echo
echo "Creating Azure DevOps Repo..."
echo
# Check if the directory exists
if [ -d "$ProjectFullPath" ]; then
  echo "Directory already exists: $ProjectFullPath"
  
  # Prompt the user for confirmation to delete the directory
  read -p "Do you want to delete the existing directory? (y/n): " confirm

  if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo "Deleting the existing directory..."
    rm -rf "$ProjectFullPath"
    
    if [[ $? -ne 0 ]]; then
      echo "Error: Failed to delete the directory: $ProjectFullPath"
      exit 1
    fi
  else
    echo "Operation canceled by the user. Exiting..."
    exit 1
  fi
fi

# Create the directory after the deletion check
echo "Creating directory: $ProjectBasePath"
echo
mkdir -p "$ProjectBasePath"
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to create directory: $ProjectBasePath"
  exit 1
fi

# Change to the project directory
echo "Change (cd) to directory: $ProjectBasePath"
echo
cd "$ProjectBasePath"
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to change to directory: $ProjectBasePath"
  exit 1
fi

# Dump the current directory for logging purposes
echo "Show (pwd) the directory:"
echo
pwd

echo "Construct the dotnet new command"
dotnetCommand="dotnet new \"$TemplateName\""

echo
echo "1. dotnetCommand == $dotnetCommand"
echo

# Append DotNewOptions if it's not empty
if [ -n "$DotNewOptions" ]; then
  dotnetCommand="$dotnetCommand $DotNewOptions"
fi

echo
echo "2. dotnetCommand == $dotnetCommand"
echo

# Append DotNewTemplateOptions if it's not empty
if [ -n "$DotNewTemplateOptions" ]; then
  dotnetCommand="$dotnetCommand $DotNewTemplateOptions"
fi

echo
echo "3. dotnetCommand == $dotnetCommand"
echo


# Execute the constructed command
echo "Executing the dotnet new command..."
eval $dotnetCommand
# Create the project using the template
# dotnet new "$TemplateName" --name "$ProjectName" --output "./$ProjectName" --verbosity detailed
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to create project with template: $TemplateName"
  exit 1
fi

# Dump the tree of the project directory
tree -CA

echo "Source code project created successfully!"