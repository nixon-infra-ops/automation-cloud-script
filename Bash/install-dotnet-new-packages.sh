#!/bin/bash

# Default package source
PackageSources="https://kyocera.pkgs.visualstudio.com/_packaging/KPLAT-Libraries/nuget/v3/index.json"

# Initialize uninstall flag to false
Uninstall=false

# Initialize an empty array for template names
TemplateNames=()

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --uninstall)
      Uninstall=true
      shift
      ;;
    --source)
      PackageSources="$2"
      shift 2
      ;;
    --templates)
      shift
      while [[ $# -gt 0 && $1 != --* ]]; do
        TemplateNames+=("$1")
        shift
      done
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# Check if template names are provided as arguments
if [ ${#TemplateNames[@]} -eq 0 ]; then
  echo "No template names provided"
  echo "Please provide template names using the --templates option"
  echo "Example: ./install-dotnet-new-packages.sh --templates TemplateName1 TemplateName2 --source https://example.com/nuget/v3/index.json --uninstall"
  exit 1
fi

# Conditionally uninstall the templates if uninstall is true
if [ "$Uninstall" = true ]; then
  for TemplateName in "${TemplateNames[@]}"; do
    echo "Uninstalling template: $TemplateName"
    dotnet new uninstall $TemplateName
  done
  exit 0
fi

# Check if source is provided as an argument
if [ -z "$PackageSources" ]; then
  echo "No package source provided"
  echo "Please provide a package source using the --source option"
  echo "Example: ./install-dotnet-new-packages.sh --templates TemplateName1 TemplateName2 --source https://example.com/nuget/v3/index.json --uninstall"
  exit 1
fi
echo "Please provide a package source using the --source option"

# Conditionally install the templates if uninstall is false
if [ "$Uninstall" = false ]; then
  for TemplateName in "${TemplateNames[@]}"; do
    echo "Installing template: $TemplateName"
    dotnet new install $TemplateName --nuget-source $PackageSources --interactive
  done
fi
