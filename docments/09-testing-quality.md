# Testing and Quality Strategy

## Test Pyramid

- Unit tests: math/core utilities, serialization, helpers.
- Integration tests: scene loading, server interactions, scripting bridges.
- End-to-end tests: editor workflows, import/export, platform smoke tests.

## Quality Gates

- Required CI build + test pass across supported targets.
- Static analysis and formatting checks.
- Performance benchmark guardrails for key scenarios.
- Regression test required for each fixed defect.

## Test Data

- Deterministic fixtures for scene/resources.
- Golden outputs for serializer/importer behavior.
- Platform-specific fixture variants only when unavoidable.

## Debugging and Diagnostics

- Structured logging and category filtering.
- Optional runtime validation modes.
- Crash symbol and call-stack collection in release workflows.

## Release Readiness Checklist

- No critical regressions open.
- Known issues triaged and documented.
- Upgrade/migration notes prepared.
- Documentation updated for shipped features.
