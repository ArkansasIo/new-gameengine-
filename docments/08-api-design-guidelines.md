# API Design Guidelines

## Principles

- Stability first: avoid breaking changes in public APIs.
- Clarity over cleverness: obvious contracts and naming.
- Minimal surface area: expose only required capabilities.
- Consistent semantics across modules.

## Naming and Contracts

- Types use clear, domain-relevant names.
- Methods represent actions; properties represent state.
- Avoid boolean-flag argument overloads that hide behavior.
- Document preconditions, postconditions, and side effects.

## Versioning and Deprecation

- Mark deprecated APIs with migration paths.
- Keep deprecations for a defined grace period.
- Track compatibility notes per release.

## Error Semantics

- Use explicit result/error return paths.
- Include enough context for debugging.
- Never suppress core pipeline failures silently.

## Threading and Safety

- Declare thread-affinity rules in API docs.
- Avoid shared mutable state in public contracts.
- Guard state transitions with clear lifecycle methods.
