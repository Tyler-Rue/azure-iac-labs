# Azure IaC Labs

Infrastructure as Code labs built on Ubuntu using Azure CLI, Bicep, and (soon) Terraform as part of my cloud development learning path.

## Project Goal

Build repeatable Azure infrastructure using code instead of manual portal clicks, while practicing validation, deployment previews, safe deployments, and cost-conscious cleanup habits.

## Technologies Used

- Ubuntu Linux
- Azure CLI
- Bicep
- Git / GitHub

## Current Lab: Bicep Storage Account Deployment

This lab uses a Bicep template to deploy an Azure Storage Account inside a Resource Group.

### Resources Defined

- Azure Storage Account
- Standard_LRS SKU
- East US region

## Workflow Practiced

1. Write infrastructure in code (`main.bicep`)
2. Build template locally
3. Lint template for best practices
4. Validate against Azure
5. Preview changes with `what-if`
6. Deploy resource
7. Verify resource creation
8. Delete resource group to avoid lingering costs

## Commands Used

```bash
az bicep build --file main.bicep
az bicep lint --file main.bicep
az deployment group validate --resource-group rg-bicep-lab --template-file main.bicep
az deployment group what-if --resource-group rg-bicep-lab --template-file main.bicep
az deployment group create --resource-group rg-bicep-lab --template-file main.bicep
az group delete --name rg-bicep-lab --yes --no-wait
```

## What I Learned

- How to define Azure resources with Bicep
- How parameters, variables, resources, and outputs work
- How to validate infrastructure before deployment
- How to preview changes safely before applying them
- How to clean up Azure resources to control cost

## Why This Matters

Infrastructure as Code improves:

- repeatability
- version control
- team collaboration
- deployment safety
- consistency across environments

## Next Steps

- Add Terraform labs
- Add reusable Bicep modules
- Add CI/CD pipeline deployments
- Expand into networking resources
