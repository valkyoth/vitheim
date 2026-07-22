# GitHub Security Settings

Configure the repository with:

- CodeQL **default setup**, not an advanced CodeQL workflow;
- Dependabot alerts, security updates, and the committed weekly update policy;
- secret scanning and push protection where available;
- private vulnerability reporting;
- protected `main` requiring CI and CodeQL checks;
- required review from `CODEOWNERS` for security and workflow changes;
- signed commits and tags where repository policy supports them;
- no Actions write permission by default and no untrusted workflow secrets;
- no crate registry secrets because publication is forbidden.

The committed workflows use read-only repository permissions, full SHA action
pins, no credential persistence, bounded timeouts, and no tag-triggered
publication. Repository settings are external state and must be checked before
every release; committed configuration cannot prove they are enabled.

