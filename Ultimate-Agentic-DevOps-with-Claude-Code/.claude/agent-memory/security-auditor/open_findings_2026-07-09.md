---
name: open-findings-2026-07-09
description: Unresolved security findings from the 2026-07-09 terraform/ audit — check whether each is fixed before re-reporting it as new.
metadata:
  type: project
---

Findings from full audit of `terraform/` on 2026-07-09 (see [[infra_shape]] for scope). Re-check
each of these on the next audit — if fixed, drop it from this list rather than re-reporting as new.

1. `terraform/.gitignore` only ignores `.terraform` — missing `*.tfstate`, `*.tfstate.backup`,
   `*.tfvars`, `crash.log*`, `override.tf*`. Risk: accidental commit of state/vars containing
   account IDs, resource ARNs, or future secrets.
2. `backend.tf` remote S3 backend block is still commented out — state is local, unencrypted,
   unlocked. This is a known deliberate bootstrap gap (see [[infra_shape]]), not necessarily a bug,
   but should be resolved once the state bucket exists.
3. `aws_s3_bucket.website` (main.tf) has no `aws_s3_bucket_server_side_encryption_configuration`,
   no `aws_s3_bucket_versioning`, and no access logging resource.
4. `aws_cloudfront_distribution.website` (main.tf) has no `logging_config` block (no access logs)
   and no `response_headers_policy_id` attached to `default_cache_behavior` — so no CSP /
   X-Frame-Options / X-Content-Type-Options / HSTS headers are set.
5. No WAFv2 Web ACL associated with the CloudFront distribution.
6. `viewer_certificate` uses `cloudfront_default_certificate = true`. Fine today since
   `var.domain_name` is unused/empty, but if a custom domain is wired in later, this must switch to
   an ACM cert with `minimum_protocol_version = "TLSv1.2_2021"` — flag as config drift risk since
   the unused `domain_name` variable already exists in `variables.tf`.

**Good patterns already in place (do not re-flag as issues):** S3 public access block has all four
flags `true`; CloudFront uses OAC (not legacy OAI) with bucket policy scoped via
`AWS:SourceArn` condition to the specific distribution ARN; `viewer_protocol_policy =
"redirect-to-https"` enforces HTTPS; account ID is pulled via `data.aws_caller_identity.current`,
not hardcoded; no IAM wildcards exist (no IAM resources exist at all yet).

**Why:** Avoids re-litigating already-known gaps as brand-new discoveries and avoids praising/
flagging things that are already correct.

**How to apply:** At the start of a new audit, read this file, then verify each item against
current `terraform/*.tf` content before including it in the report (files may have changed).
