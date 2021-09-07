
# Introduction to Infrastructure Repo
- This code setups infrastructure deployment pipeline using the manual steps and bootstrap azure cli script.
- Once pipeline is deployed, the pipeline is used to deploy ohter infrastructure resources using Terraform.
- Terraform state and lock is stored in Azure storage backend (The storage account name should be globally unique. Hence you will have to define a unique storage account name)

# Running the bootstrap template to create the pipeline.
- Requirements
  - Azure CLI
  - Azure Account

# Create Azure DevOps Organization 
- Azure DevOps Organization could only be created using the Azure DevOps Portal.

# Create DevOps Project & Other components.
- Update `bootstrap.pwsh` as per your Organization.
- Execute the script with Azure CLI
- Provide Azure credentials to login into console.

# Apply for Pipeline credits from Azure
- You may require to apply for pipeline credits from Azure to run the pipelines.
- Update the variables in bootstrap.pwsh as per your requirements.

- Execute the following command to deploy the pipeline.
  - cd bootstrap
  - aws cloudformation create-stack --stack-name bootstrap-stack --template-body file://bootstrap.yml --parameters file://bootstrap.json --profile `aws-profile-name` --capabilities CAPABILITY_NAMED_IAM

- Setting Up Initial AWS Resources
  - Any change to the `InfraSourceBranch` branch defined in the `bootstrap.json` will trigger the infrastructure pipeline to create / delete / update resources.

- Adding / Modifying Resources
  - Add new resources to ./dev/main.tf
  - Modify ./dev/var.tf, ./dev/output.tf as required.

- Removing Resources
  - Comment / Delete items in ./dev/main.tf and ./dev/output.tf
