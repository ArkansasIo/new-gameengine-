# Release and Roadmap

## Release Process

1. Feature freeze and branch cut.
2. Stabilization with bug triage and regression testing.
3. Release candidate builds and verification.
4. Final release, tag, and changelog publication.

## Semantic Strategy

- Major: architectural or compatibility-impacting changes.
- Minor: additive features and non-breaking enhancements.
- Patch: fixes and low-risk quality updates.

## Maintenance Plan

- Maintain latest stable and one previous minor line.
- Prioritize security, correctness, and data-loss bugs.
- Backport only low-risk and high-value fixes.

## Roadmap Themes

- Rendering scalability and tooling quality.
- Asset pipeline throughput and determinism.
- Script/runtime interoperability and performance.
- Developer ergonomics and documentation maturity.

## Documentation Governance

- Docs are versioned with source changes.
- Significant architecture changes must update `docments/`.
- UML and class docs are treated as release artifacts.
