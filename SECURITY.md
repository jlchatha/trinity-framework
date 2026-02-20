# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in Trinity Framework,
please report it through one of these channels:

**Preferred:** Use GitHub's private vulnerability reporting.
Go to the Security tab of this repository and click "Report a vulnerability."

**Alternative:** Email apex@trinity-apex.com with details.

Do not open a public GitHub issue for security vulnerabilities.

## Scope

Trinity Framework is a protocol file system (markdown files and bash scripts).
It does not process credentials, manage network access, or handle sensitive data
directly. However, protocol files may reference sensitive resources — never store
credentials, API keys, or secrets in protocol files.

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.0.x   | ✓         |
