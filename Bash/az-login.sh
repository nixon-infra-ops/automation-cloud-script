#!/bin/bash

# Perform Azure login
if ! az account show &> /dev/null; then
  echo "Not logged in. Logging in now..."
  az login --use-device-code
  # Check if login was successful
  if [ $? -eq 0 ]; then
    echo "Login successful."
    return 0  # Use return instead of exit
  else
    echo "Login failed."
    return 1  # Return an error code if login failed
  fi
else
  echo "Already logged in."
  return 0  # Use return instead of exit
fi