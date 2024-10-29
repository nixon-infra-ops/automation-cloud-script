#!/bin/bash

source ./variables.sh

echo
echo "Creating Azure DevOps Repo..."
echo

# Check if the directory exists
if [ -d "$ProjectBasePath" ]; then
  echo "Directory already exists: $ProjectBasePath"
fi

echo
echo "Creating Azure DevOps Repo: Debug 001"

# change to the project directory
cd "$ProjectFullPath"

echo
echo "Creating Azure DevOps Repo: Debug 002"

# Check if .git directory exists
# If not, initialize git repository
if [ ! -d ".git" ]; then
  echo "Git repository not initialized. Initializing now..."
  git init
else
  echo "Git repository already initialized."
fi

echo
echo "Creating Azure DevOps Repo: Debug 003"

# Add all files to the staging area
git add .

echo
echo "Creating Azure DevOps Repo: Debug 004"

# Check if the files were staged
git status

echo
echo "Creating Azure DevOps Repo: Debug 005"

# Commit changes
git commit -am "Initial commit"

echo
echo "Creating Azure DevOps Repo: Debug 006"

# [13] [OPTIONAL] Check commit was created
git log

echo
echo "Creating Azure DevOps Repo: Debug 007"

# Add a remote git repository (2nd box from Azure DevOps)
git remote add origin "$GitRemotePath"

echo
echo "Creating Azure DevOps Repo: Debug 008"

git remote set-url \
origin "$GitRemotePath"

echo
echo "Creating Azure DevOps Repo: Debug 009"

# [16] [OPTIONAL] Check if it has remote repository, again
git remote

echo
echo "Creating Azure DevOps Repo: Debug 010"

# Push to Azure DevOps
# Code is pushed to the master branch
# git push -u origin --all
git -c http.extraheader="AUTHORIZATION: Basic ${AUTH_HEADER}" push origin --all

echo
echo "Creating Azure DevOps Repo: Debug 011"

# Return to the original directory
cd "$CurrentDirectory"

echo
echo "Creating Azure DevOps Repo: Debug 012"

# Check if the directory exists
# Remove the project directory if the user wants to
if [ -d "$ProjectFullPath" ]; then
  echo "Directory exists: $ProjectFullPath"
  
  # Prompt the user for confirmation to delete the directory
  read -p "Do you want to delete the existing directory? (y/n): " confirm

  if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo "Deleting the directory: $ProjectFullPath"
    rm -Rf "$ProjectFullPath"
    
    if [[ $? -ne 0 ]]; then
      echo "Error: Failed to delete the directory: $ProjectFullPath"
      exit 1
    fi
    echo "Directory deleted successfully. Exiting..."
  else
    echo "User choose not to delete the directory. Exiting..."
    exit 0
  fi
else
  echo "Directory does not exist. Nothing to delete. Exiting..."
fi
