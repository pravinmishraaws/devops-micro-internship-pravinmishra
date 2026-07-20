---
name: scaffold-terraform
description: Generate complete Terraform infrastructure for S3 + CloudFront static site hosting. Use when setting up a new project or regenerating infrastructure files.
allowed-tools: Bash, Read, Write, Grep, Glob
disable-model-invocation: true
argument-hint: "[aws-region] [project-name]"
---

Generate a complete Terraform configuration for deploying a static website to AWS using S3 + CloudFront.

Use $ARGUMENTS for optional overrides:
- $0 = AWS region (default: ap-south-1)
- $1 = Project name (default: portfolio-site)

## What to Generate

Read `template-spec.md` in this skill folder for the full infrastructure specification.

Generate all files in the `terraform/` directory following the template spec.

## After Generation

- [ ] List all files created
- [ ] Show a summary of resources that will be provisioned
- [ ] Remind the engineer to review the files and run `/tf-plan` when ready
