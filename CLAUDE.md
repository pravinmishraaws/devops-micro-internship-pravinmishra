## Project Overview

Static HTML/CSS portfolio website deployed to AWS using S3 and CloudFront, provisioned with Terraform, and automated via GitHub Actions.

## Architecture

- Pure HTML5 and CSS3
- No JavaScript
- No build step
- No framework

## Commands

- terraform init
- terraform plan
- terraform apply

## Conventions

- All infrastructure changes go through Terraform — never modify AWS resources manually
- No JavaScript in this project
- CSS uses mobile-first approach with breakpoints at 900px, 768px, and 600px

## Safety

Never put secrets in this file. No API keys, passwords, or AWS credentials.
