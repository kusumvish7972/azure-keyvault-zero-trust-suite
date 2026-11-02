<div align="center">

# ðŸ” Azure Key Vault Zero-Trust Suite
### Enterprise Key Vault Architecture with Private Endpoints, RBAC & for_each Dynamic Provisioning

[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.5.0-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://terraform.io)
[![Azure Provider](https://img.shields.io/badge/AzureRM-v3.90%2B-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
[![Security](https://img.shields.io/badge/Security-Zero--Trust%20Hardened-critical?style=for-the-badge&logo=microsoft&logoColor=white)](#)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=for-the-badge)](LICENSE)

<br/>

> **Production-ready, battle-tested Azure Key Vault module** using child & parent Terraform architecture. Features complete public access denial, Private DNS integration, automated RSA key generation via `for_each`, secret maps, and User-Assigned Managed Identity RBAC.

</div>

---

## âš¡ Zero-Trust Architecture Checklist
- [x] **Public Network Access**: Completely disabled (`public_network_access_enabled = false`).
- [x] **Private Link**: Azure Private Endpoint with automated Private DNS Zone (`privatelink.vaultcore.azure.net`).
- [x] **Authorization Engine**: Azure RBAC enabled (`enable_rbac_authorization = true`).
- [x] **Data Loss Prevention**: Soft-delete (90 days) + Purge Protection enabled.
- [x] **Dynamic Scalability**: Secrets and RSA keys managed dynamically using Terraform `for_each`.

---

## ðŸš€ Quickstart Deployment

```bash
git clone https://github.com/kusumvish7972/azure-keyvault-zero-trust-suite.git
cd azure-keyvault-zero-trust-suite

terraform init
terraform plan
terraform apply
```

<sub>Maintained by **Kusum Vishwakarma** â€¢ Principal Enterprise Cloud Architect</sub>