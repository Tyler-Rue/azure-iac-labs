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
5. Verify resource
6. `terraform destroy`

### Skills Demonstrated

- Provider-based IaC
- Infrastructure planning before apply
- State-managed deployments
- Full resource lifecycle management

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
  bicep/
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
