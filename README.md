# AWS Infrastructure with Terraform & GitHub Actions

This repository manages a secure, scalable AWS infrastructure using **Terraform**. It includes a VPC, ALB, and ACM certificates, all deployed via a **GitOps CI/CD pipeline**.

## 🏗 Architecture
- **VPC:** Custom VPC with Public/Private subnets across multiple AZs.
- **ALB:** Application Load Balancer with HTTP to HTTPS redirection.
- **ACM:** SSL/TLS certificate with DNS validation via Cloudflare.
- **Security:** Managed Security Groups for least-privilege access.



[Image of AWS Infrastructure Architecture Diagram]


---

## 🚀 CI/CD Workflow
The deployment process follows a strict promotion logic:

1. **Staging:** Pushing to the `staging` branch triggers a `terraform plan` for validation.
2. **Review:** Opening a Pull Request to `main` shows a final plan for peer review.
3. **Manual Approval:** Once merged to `main`, the workflow pauses for **manual approval** in GitHub Actions.
4. **Deploy:** After approval, `terraform apply` runs and updates the AWS infrastructure.

---

## 🛠 Prerequisites
- **Terraform:** v1.5.0+
- **AWS Account:** With OIDC provider configured for GitHub Actions.
- **Cloudflare:** Access to manage CNAME records for domain validation.

## ⚙️ Configuration
### GitHub Secrets Required
| Secret Name | Description |
| ----------- | ----------- |
| `AWS_OIDC_ROLE` | The ARN of the IAM Role for OIDC |
| `DOMAIN_NAME` | The base domain for ACM (e.g., example.com) |

## 📖 Usage
### Local Development
```bash
terraform init
terraform plan -var-file="terraform.tfvars"