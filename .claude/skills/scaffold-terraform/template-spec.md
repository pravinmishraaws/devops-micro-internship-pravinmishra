# Template Specification

## Files to Generate

1. `terraform/main.tf` - Main Terraform configuration
2. `terraform/variables.tf` - Input variables
3. `terraform/outputs.tf` - Output values
4. `terraform/terraform.tfvars` - Variable values
5. `terraform/provider.tf` - Provider configuration

## Architecture

- S3 bucket for static website hosting
- CloudFront CDN for content delivery
- Route53 DNS configuration (optional)
- IAM roles and policies
