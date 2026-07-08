# Terraform Template Specification

Generate these files in the `terraform/` directory:

**terraform/main.tf:**
- S3 bucket (private, no public access, block all public ACLs)
- S3 bucket policy granting CloudFront OAC read access
- CloudFront Origin Access Control (OAC) — NOT legacy OAI
- CloudFront distribution with:
  - S3 origin using OAC
  - Default root object: index.html
  - Custom error response: 404 → /index.html (200)
  - Viewer protocol policy: redirect-to-https
  - Price class: PriceClass_200
  - Default cache behavior with CachingOptimized managed policy
- All resources tagged with `Project` and `Environment` variables

**terraform/variables.tf:**
- Variables for: region, project_name, environment (default "production"), domain_name (default "")

**terraform/outputs.tf:**
- Outputs for: cloudfront_distribution_id, cloudfront_domain_name, s3_bucket_name, s3_bucket_arn

**terraform/providers.tf:**
- AWS provider with region variable, terraform block with required_version >= 1.5 and AWS provider source

**terraform/backend.tf:**
- S3 backend block (commented out with instructions to uncomment after creating state bucket)
- Include comments explaining: first run `terraform init` without backend, create the resources, then uncomment backend and run `terraform init -migrate-state`
