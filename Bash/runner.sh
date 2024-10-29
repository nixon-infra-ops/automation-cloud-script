#!/bin/bash

# Source the showHelp.sh file to include the show_help function
source ./showHelp.sh

# Loop through all arguments to check for -h or --help
for arg in "$@"; do
  if [[ "$arg" == "-h" || "$arg" == "--help" ]]; then
    show_help
    exit 0
  fi
done

# Check if the user is already logged in
source ./az-login.sh
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to log in to Azure."
  exit 1
fi

# Prompt the user for variables
source ./prompt-for-variables.sh
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to prompt for variables."
  exit 1
fi

source ./variables.sh
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to source variables."
  exit 1
fi

# Implement dry-run functionality
if [[ "$arg" == "--dry-run" ]]; then
  echo "Dry-run complete. Create DevOps project and repo were skipped."
  exit 0
fi

############################################
# Main Scripts Called Here
############################################

# Call the create-sourcecode-project.sh script
./create-sourcecode-project.sh
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to create source code project."
  exit 1
fi

# Call the create-devops-project script
./create-devops-project.sh
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to create DevOps project."
  exit 1
fi

# Only call create-devops-repo.sh if create-devops-project.sh succeeded
./create-devops-repo.sh
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to create DevOps repository. Return: $?"
  exit 1
fi

echo "Azure DevOps Repository created successfully. Return: $?"

exit 0
