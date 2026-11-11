# WOCS'hACK 2025 Bug Bounty Experience

My findings from **WOCS'hACK 2025**, a CTF-style bug bounty run on a dedicated,
organizer-built target environment (`*.3xploit.me`). This was my first hands-on
vulnerability research. Findings are published with the organizers' authorization,
in line with the event rules.

## Findings

| # | Vulnerability | Type | Severity (CVSS 3.1) | Status |
|---|---------------|------|---------------------|--------|
| 1 | SQL Injection via GET parameter | CWE-89 | 9.8 Critical | Accepted |
| 2 | Unrestricted file upload leading to potential RCE | CWE-434 | 9.6 Critical | Accepted |
| 3 | Source code disclosure via `php://filter` (PHP file inclusion) | CWE-98 | 7.5 High | Accepted |

**Full write-up:** [WOCS-hACK-2025-WriteUp.pdf](WOCS-hACK-2025-WriteUp.pdf)
(endpoint, payload, impact and remediation per finding). Source: `WOCS-hACK-2025-WriteUp.typ`.

## What I took away

- Reading an application like an attacker: parameters, upload handlers, include logic.
- Writing clear, reproducible vulnerability reports with impact and remediation.
- Moving from automated confirmation (`sqlmap`) to understanding the root cause.
