# Access Control Standard

## Purpose

Define a repeatable approach for granting, reviewing, and removing access to cloud and platform resources.

## Principles

- Grant least privilege access by default.
- Use named roles instead of shared user accounts.
- Require approval for production access.
- Review privileged access regularly.
- Remove access promptly when no longer required.
- Log administrative activity for audit purposes.

## Pull Request Checks

Infrastructure changes should show:

- role name and purpose
- trusted principal
- allowed actions
- allowed resources
- expiry or review date where temporary access is required

## Operational Notes

Access changes should be traceable through tickets, pull requests, and cloud audit logs.
