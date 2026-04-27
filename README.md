# Azure IaC Labs

Infrastructure as Code labs built on Ubuntu using Azure CLI, Bicep, and Terraform as part of my cloud development learning path.

## Project Goal

Build repeatable Azure infrastructure using code instead of manual portal clicks, while practicing validation, deployment previews, safe deployments, and cost-conscious cleanup habits.

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
6. Verify creation
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

# Why This Matters

Infrastructure as Code improves:

- repeatability
- version control
- deployment safety
- consistency across environments
- team collaboration

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
  terraform/
    resource-group/
      main.tf
  README.md
```

---

# Next Steps

- Add Terraform Storage Account lab
- Add reusable Bicep modules
- Add CI/CD pipeline deployments
- Add networking labs (VNets / NSGs)
- Add remote Terraform state examples
