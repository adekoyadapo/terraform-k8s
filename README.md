# k8s cluster creation on cloud providers
# AKS clusters setup using Terraform

The intention is to create azure-go-to demo...and variablize the world "completely" is work in progress...

The `Makefile` in this directory provides automated provisioning of k8s clusters with TSB installed on Azure. 

![Workflow](workflow.jpg?raw=true "Workflow")

The setup consists of

* module.azure_base   - deploys resource group, vnet and acr
* module.azure_k8s  - deploys k8s cluster for MP and N-number of CPs(*) leveraging AKS
* module.azure_oidc - (optional) deploys Azure AD prereqs
* module.elastic    - deploys ECK on MP k8s cluster
* module.cert-manager - deploys cert-manager on MP k8s cluster
* module.tsb_mp     - responsible for MP setup
* module.tsb_cp     - responsible for CP setup

## Requirements

- terraform >= 1.0.0
- configured and assumed Azure role

## Usage

terraform.tfvars

```
name_prefix = "juggles"
location    = "eastus"
cidr        = "172.16.0.0/16"
```

To create the resources:
```bash
make aks
make app_bookinfo
```
This will trigger Terraform, which in turn will:
- create the components outlined above
- output kubeconfig files for all the created aks clusters in format of: $name_prefix-aks-*-kubeconfig 

When you are done with the environment, you can destroy it by running:

```bash
make destroy
```

### Usage notes
- Terraform destroys only the resources it created.
- Terraform stores the `state` locally
- variablize the world "completely" is work in progress...
