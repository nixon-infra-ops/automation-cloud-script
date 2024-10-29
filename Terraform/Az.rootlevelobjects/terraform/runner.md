# How to run this set of Terraform files

```terraform
# make sure terraform CLI is installed
terraform

# format the tf files
terraform fmt

# initialize terraform Azure modules
terraform init

# initialize terraform for this directory
terraform init -reconfigure

# validate the template
terraform validate

terraform plan -var-file=00_rootlevelobjects-payg.tfvars -out=plan.tfplan

terraform plan -var-file=00_rootlevelobjects-kplat.tfvars -out=plan.tfplan

terraform plan -var-file=00_rootlevelobjects-devtest.tfvars -out=plan.tfplan

terraform apply -refresh-only plan.tfplan

terraform destroy -var-file=00_performancereview.tfvars
```

## Useful commands

### terraform state list

```Terraform
# This command lists resource instances in the Terraform state. The address
# argument can be used to filter the instances by resource or module. If
# no pattern is given, all resource instances are listed.

terraform plan -var-file=00_performancereview.tfvars -out=plan.tfplan

terraform apply -auto-approve plan.tfplan

terraform state list

terraform output
terraform output tags-stage


```
