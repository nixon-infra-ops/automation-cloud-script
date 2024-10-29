# KII Dotnet Templates

[[_TOC_]]

## Prerequisites for Installing the Templates

### Azure Artifacts Credential Provider

Find out more here: https://github.com/microsoft/artifacts-credprovider

```sh
sh -c "$(curl -fsSL https://aka.ms/install-artifacts-credprovider.sh)"
```

## Install KII VS Templates

This script is used to install KII VS Templates on your local machine

### Make a list of templates you want to install
```sh
TemplateList=(
  "KII.Platform.Template.ClassLibrary.UI.NET8"
  "KII.Platform.Template.ClassLibrary.Utility.NET8"
  "KII.Platform.Template.CommonWebApi.MONGODB.NET8"
  "KII.Platform.Template.CommonWebApi.SQLDAPPER.NET8"
  "KII.Platform.Template.HostedBlazor.MONGODB.NET8"
  "KII.Platform.Template.HostedBlazor.SQLDAPPER.NET8"
)
```

After you make the list, you can check it by using these commands.

```sh
# Use these commands to see the list of templates...
echo "${TemplateList[@]}"

# Loop through the array and print each item
for template in "${TemplateList[@]}"; do
  echo "$template"
done
```

### Install the templates

The `install-dotnet-new-packages.sh` script is expecting a list of templates to install (or uninstall)

***Install***

```sh
# Intall command
./install-dotnet-new-packages.sh \
--templates "${TemplateList[@]}" \
--source "https://kyocera.pkgs.visualstudio.com/_packaging/KPLAT-Libraries/nuget/v3/index.json" \
2>&1 | tee ~/install-dotnet-new-packages_install.log

cat ~/install-dotnet-new-packages_install.log
```

***Uninstall***

```sh
# Unintall command
./install-dotnet-new-packages.sh \
--templates "${TemplateList[@]}" \
--source "https://kyocera.pkgs.visualstudio.com/_packaging/KPLAT-Libraries/nuget/v3/index.json" \
--uninstall \
2>&1 | tee ~/install-dotnet-new-packages_uninstall.log

cat ~/install-dotnet-new-packages_uninstall.log
```

## New Azure DevOps Project

Now that you have the templates installed, you can create a new Azure DevOps project and create it's Repo based on one of the templates you have installed.

```sh
./runner.sh --template-name KII.Platform.Template.HostedBlazor.SQLDAPPER.NET8 \
--project-name KII.MKH.Demo \
--project-description "Provide a description of the project here." \
--pat "s5xuxvtv7nmyfuqpbgkxb3toyic6ek46ukkmj4knj322lxlaxkfa"
```

***NOTE:*** There are some settings that are hard-coded in the `create-devops-repo.sh` and `create-devops-new-packages.sh` scripts.  Review these scripts before you use them.
