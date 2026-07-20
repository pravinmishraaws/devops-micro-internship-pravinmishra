---
name: tf-apply
description: Run terraform apply to create or update AWS infrastructure. Use after reviewing a terraform plan.
allowed-tools: Bash, Read
disable-model-invocation: true
---

Run `cd terraform && terraform apply -auto-approve -no-color` and verify the results.

After apply completes:
- [ ] Show the key outputs (CloudFront URL, S3 bucket name, distribution ID)
- [ ] Verify the deployment by checking if the CloudFront distribution status is "Deployed"
- [ ] Report any errors and suggest fixes

If apply fails, do NOT retry automatically. Show the error and wait for instructions.
