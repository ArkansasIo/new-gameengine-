# System Architecture

## Architectural Style

The engine uses a layered modular architecture:

1. Platform Layer: OS, windowing, input, filesystem, threading, timing.
2. Core Layer: memory, containers, object model, reflection, variant types, messaging.
3. Server Layer: render server, physics server, audio server, navigation server.
4. Scene Layer: nodes, resources, animation, UI, gameplay-facing systems.
5. Tooling Layer: editor, importers, debugger, project settings, plugins.

## Key Boundaries

- `core/` must not depend on `scene/` or `editor/`.
- `servers/` expose interfaces consumed by scene-level features.
- `editor/` is optional at runtime and isolated from export templates.
- `platform/` provides backend adapters, not engine policy.

## Data Flow

- User input enters through platform events.
- Core dispatches signals/events to scene nodes.
- Scene changes generate draw/physics/audio commands.
- Servers submit work to backend implementations.
- Frame synchronization coordinates update and render phases.

## Threading Model

- Main thread: scene tree updates, gameplay callbacks, UI/editor logic.
- Worker threads: asset import, asynchronous resource loading, background jobs.
- Render/driver threads: backend-dependent command submission.

## Memory and Lifetime

- Explicit ownership boundaries between engine objects and resources.
- Reference counting for shared resources.
- Object IDs and registries for safe cross-system lookup.
- Deterministic teardown order at scene and engine shutdown.
