#!/bin/bash

# Function to display help message
show_help() {
  echo "Welcome to the Azure DevOps Project Creator"
  echo
  echo "This script will create a new Azure DevOps project and repository for you."
  echo "Please make sure you have the following information ready:"
  echo "  * Your Visual Studio Template Name"
  echo "  * Your Azure DevOps Project Name"
  echo "  * Your Azure DevOps Project Description"
  echo "  * Your Azure DevOps Personal Access Token (PAT)"
  echo
  echo "Usage: ./runner.sh [options]"
  echo
  echo "Options:"
  echo "  -h, --help                   Show this help message and exit"
  echo "  -t, --template-name          Specify the template name to use"
  echo "  -p, --project-name           Specify project name to create"
  echo "  -P, --project-description    Describe the project to create"
  echo "  --pat                        Specify the Azure DevOps PAT"
  echo "  --dry-run                    Dryrun the script without creating the project and repo.  Variables will be created."
  echo
  echo "Example:"
  echo "  ./runner.sh --template-name KII.Platform.Template.HostedBlazor.SQLDAPPER.NET8 \\"
  echo "    --project-name KII.Platform.Lib.DoSomethingNice \\"
  echo "    --project-description \"This project does nice things\" \\"
  echo "    --pat 'ageca88easd94'"
  echo
  echo "Variables prompted in PromptForVariables.sh:"
  echo "  ProjectName           The name of the Azure DevOps project"
  # Add more variables here if PromptForVariables.sh prompts for additional variables
}