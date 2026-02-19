# Class Design

## Core Class Families

- Object and reflection classes: identity, metadata, property system.
- Resource classes: serializable data assets with dependency references.
- Node classes: scene graph entities with lifecycle callbacks.
- Server interface classes: abstract contracts for subsystems.
- Backend implementation classes: concrete platform/API behavior.

## Class Responsibilities

- Keep classes cohesive and focused on one concern.
- Prefer composition over deep inheritance.
- Separate immutable data containers from stateful controllers.
- Keep editor-only behavior out of runtime classes.

## Ownership Patterns

- `Ref<T>` for shared resource ownership.
- Scoped ownership for transient runtime objects.
- Registry-managed singletons for subsystem coordinators.

## Interface Design

- Use small, capability-oriented interfaces.
- Pass stable value types across API boundaries.
- Avoid exposing raw internal containers in public APIs.
- Document invariants for each public method.

## Error and Contract Design

- Validate inputs at module boundaries.
- Return descriptive errors; avoid silent fallback in core paths.
- Assert impossible states in debug builds.

## Example Responsibility Matrix

| Class Type | Owns State | Mutates Engine | Serialized | Thread Affinity |
|---|---|---|---|---|
| Resource | Yes | No (directly) | Yes | Any (load-safe) |
| Node | Yes | Yes | Optional | Main thread |
| Server Interface | Minimal | Yes | No | Main/worker defined by implementation |
| Backend Driver | Yes | Yes | No | Backend-specific |
