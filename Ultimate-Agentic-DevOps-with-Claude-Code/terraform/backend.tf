# Uncomment the following block after creating a dedicated S3 bucket for Terraform state
# Follow these steps:
# 1. First run: terraform init
# 2. Run: terraform apply
# 3. Manually create an S3 bucket for Terraform state (with versioning enabled)
# 4. Uncomment the backend block below
# 5. Run: terraform init -migrate-state
#
# terraform {
#   backend "s3" {
#     bucket         = "your-terraform-state-bucket"
#     key            = "portfolio-site/terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }
