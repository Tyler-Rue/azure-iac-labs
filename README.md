# Azure IaC Labs

Infrastructure as Code labs built on Ubuntu using Azure CLI, Bicep, Terraform, and GitHub Actions as part of my cloud development learning path.

## Project Goal

Build repeatable Azure infrastructure using code instead of manual portal clicks, while practicing validation, deployment previews, safe deployments, automation, reusable architecture, and cost-conscious cleanup habits.

## Technologies Used

- Ubuntu Linux
- Azure CLI
- Bicep
- Terraform
- Git / GitHub
- GitHub Actions
- YAML

---

# Labs Included

## 1. Bicep Storage Account Deployment

Created an Azure Storage Account using Bicep with the following workflow:

1. Build template locally
2. Lint template
3. Validate against Azure
4. Preview changes using `what-if`
5. Deploy resource
6. Verify resource with Azure CLI
7. Delete resource group after testing

### Skills Demonstrated

- Azure-native IaC
- Parameters / variables / outputs
- Safe deployment workflow
- Cost control through cleanup

---

## 2. Terraform Resource Group Deployment

Created an Azure Resource Group using Terraform with the following workflow:

1. `terraform init`
2. `terraform validate`
3. `terraform plan`
4. `terraform apply`
5. Verify resource group with Azure CLI
6. `terraform destroy`

### Skills Demonstrated

- Provider-based IaC
- Infrastructure planning before apply
- State-managed deployments
- Full resource lifecycle management

---

## 3. Bicep Networking Lab

Created core Azure networking resources using Bicep.

### Resources Deployed

- Virtual Network (VNet)
- Subnet
- Network Security Group (NSG)
- Inbound HTTP allow rule (port 80)
- NSG associated to subnet

### Workflow Practiced

1. Build template locally
2. Lint template
3. Validate against Azure
4. Preview changes using `what-if`
5. Deploy networking resources
6. Verify resources with Azure CLI
7. Delete resource group after testing

### Skills Demonstrated

- Azure networking fundamentals
- CIDR addressing and subnet segmentation
- Basic firewall rule management
- Resource dependencies in Infrastructure as Code
- Safe deployment workflow

---

## 4. CI/CD Validation Workflow

Added a GitHub Actions pipeline that automatically validates Infrastructure as Code changes on every push and pull request.

### Automated Checks

- Bicep template build validation
- Terraform formatting check
- Terraform init
- Terraform validate

### Skills Demonstrated

- CI/CD pipeline fundamentals
- YAML workflow configuration
- Automated quality gates
- Shift-left validation practices

---

## 5. Bicep Multi-Environment Lab

Created a Bicep template that supports environment-based deployments for `dev`, `test`, and `prod`.

### Resources Deployed

- Azure Storage Account
- Environment-specific naming
- Environment-specific SKU selection
- Resource tags for environment, project, and management source

### Workflow Practiced

1. Build template locally
2. Lint template
3. Validate environment-specific deployment
4. Preview changes using `what-if`
5. Deploy the `dev` environment
6. Verify resource tags and SKU with Azure CLI
7. Delete resource group after testing

### Skills Demonstrated

- Multi-environment infrastructure design
- Bicep parameters and allowed values
- Conditional configuration
- Tagging strategy
- Cost-conscious deployment practices

---

## 6. Reusable Bicep Modules Lab

Refactored the multi-environment Bicep deployment to use a reusable storage account module.

### Resources / Components Added

- Reusable storage account module
- Environment template using module composition
- Shared tagging strategy
- Environment-based SKU selection

### Workflow Practiced

1. Build and lint standalone module
2. Refactor environment template to call module
3. Validate modular deployment
4. Preview changes using `what-if`
5. Deploy the `dev` environment
6. Verify resource tags and SKU with Azure CLI
7. Delete resource group after testing

### Skills Demonstrated

- Bicep module design
- Reusable Infrastructure as Code
- Separation of concerns
- Environment-based configuration
- Maintainable IaC structure

---

## 7. Terraform Multi-Environment Storage Lab

Created a Terraform template that supports environment-based deployments for `dev`, `test`, and `prod`.

### Resources Deployed

- Azure Resource Group
- Azure Storage Account
- Environment-specific naming
- Environment-specific storage replication selection
- Resource tags for environment, project, and management source

### Workflow Practiced

1. `terraform init`
2. `terraform fmt`
3. `terraform validate`
4. `terraform plan -var="environment=dev"`
5. `terraform apply -var="environment=dev"`
6. Verify resources with Azure CLI
7. `terraform destroy -var="environment=dev"`

### Skills Demonstrated

- Terraform variables and validation
- Terraform locals
- Multi-environment infrastructure design
- Tagging strategy
- Full Terraform lifecycle management

---

## 8. Terraform Remote State Lab

Configured Terraform to use Azure Storage as a remote backend for state management.

### Resources Deployed

- Azure Storage Account (remote backend)
- Blob Container for Terraform state
- Remote state file stored in Azure

### Workflow Practiced

1. Create backend storage resources with Azure CLI
2. Configure Terraform backend block
3. Reinitialize Terraform with `terraform init -reconfigure`
4. Apply infrastructure using remote state
5. Verify state file exists in Azure Blob Storage

### Skills Demonstrated

- Terraform state management
- Remote backend configuration
- Azure Storage integration
- Separation of infrastructure and state
- Real-world Terraform workflow practices

---

## 9. Terraform Networking Lab

Created Azure networking resources using Terraform with remote state.

### Resources Deployed

- Azure Resource Group
- Virtual Network (VNet)
- Subnet
- Network Security Group (NSG)
- NSG rule allowing HTTP traffic
- NSG association to subnet

### Workflow Practiced

1. `terraform init` (remote backend)
2. `terraform fmt`
3. `terraform validate`
4. `terraform plan -var="environment=dev"`
5. `terraform apply -var="environment=dev"`
6. Verify resources with Azure CLI
7. `terraform destroy -var="environment=dev"`

### Skills Demonstrated

- Terraform networking configuration
- Remote state usage
- Resource relationships and dependencies
- Network security concepts
- Full Terraform lifecycle management

---

# Why This Matters

Infrastructure as Code improves:

- repeatability
- version control
- deployment safety
- consistency across environments
- team collaboration
- faster feedback through automation
- reusable architecture

---

# Repository Structure

```text
azure-iac-labs/
  .github/
    workflows/
      validate-iac.yml
  bicep/
    main.bicep
    networking/
      main.bicep
    environments/
      main.bicep
    modules/
      storage-account.bicep
  terraform/
    resource-group/
      main.tf
    environments/
      main.tf
    networking/
      main.tf
  README.md
```

---

# Next Steps

- Assign RBAC roles for storage instead of using account keys
- Add automated dev deployments with GitHub Actions
- Add reusable Terraform modules
- Add monitoring / logging labs (Azure Monitor)
- Add advanced networking (route tables, peering)
