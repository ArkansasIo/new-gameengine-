# Module Design

## Module Inventory

- `core`: containers, memory, object model, reflection, math, utilities.
- `drivers`: low-level API bindings and backend implementations.
- `servers`: render/physics/audio/navigation interfaces and orchestrators.
- `scene`: gameplay-facing nodes/resources and scene-tree systems.
- `editor`: tooling UI, inspectors, import UX, debugging.
- `platform`: OS-specific adapters.
- `modules`: optional features (language bindings, specialized systems).

## Design Rules

- Each module has a single responsibility and explicit API surface.
- Cross-module calls must use declared interfaces, not internal symbols.
- Optional modules compile independently and degrade gracefully.
- Keep ABI-sensitive interfaces stable across patch/minor updates.

## Dependency Guidelines

- Allowed direction: `platform -> core -> servers -> scene -> editor`.
- Optional module dependencies must be documented in module README files.
- Third-party code remains isolated under `thirdparty/`.

## Extension Strategy

- Add features through modules when isolation is possible.
- Promote shared utilities to `core` only after proving reuse.
- Expose extension points before adding hardcoded engine-specific hooks.
