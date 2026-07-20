---
name: infra-shape
description: Current shape of terraform/ directory for the portfolio-site project — scope boundaries so future audits know what's expected vs missing.
metadata:
  type: project
---

As of 2026-07-09, `terraform/` contains only 5 files: `main.tf`, `providers.tf`, `variables.tf`,
`outputs.tf`, `backend.tf`. The project is a static HTML/CSS portfolio (per CLAUDE.md) with no
JS, no build step, no backend/API.

- `main.tf` defines: `aws_s3_bucket.website`, `aws_s3_bucket_public_access_block.website`,
  `aws_cloudfront_origin_access_control.s3_oac`, `aws_s3_bucket_policy.website`,
  `aws_cloudfront_distribution.website`, `aws_cloudfront_function.add_trailing_slash`.
- No `aws_iam_*` resources exist anywhere in the repo yet — no OIDC provider, no GitHub Actions
  IAM role. Don't flag "missing OIDC scoping" as if a broken OIDC policy exists; instead flag it
  as "not yet provisioned" if GitHub Actions deployment is being added.
- `backend.tf` intentionally ships with the S3 remote-backend block commented out, with inline
  instructions to bootstrap a state bucket manually then `terraform init -migrate-state`. This is
  a deliberate two-phase bootstrap, not an oversight — but until that migration happens, state is
  local (unencrypted at rest, no locking).
- No `.tfvars`, no CI workflow files (`.github/workflows/`) present yet.

**Why:** Keeps future audits from re-deriving scope from scratch and from misreporting
"not-yet-built" pieces (IAM/OIDC/CI) as broken configurations rather than absent ones.

**How to apply:** When auditing, check whether this file list has grown (IAM/OIDC/CI workflows
added) — if so, this memory is stale and should be updated. Cross-reference
[[open_findings_2026-07-09]] for specific unresolved gaps in the existing files.
