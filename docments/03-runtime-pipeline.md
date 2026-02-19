# Runtime Pipeline

## Boot Sequence

1. Parse command-line arguments and project settings.
2. Initialize platform services (window, input, timers, filesystem).
3. Initialize core singletons and server interfaces.
4. Load project metadata and autoloads.
5. Build initial scene tree and enter main loop.

## Frame Lifecycle

1. Poll platform events.
2. Dispatch input to viewport and active scene.
3. Fixed-step simulation (physics).
4. Variable-step process/update callbacks.
5. Animation, audio, and navigation updates.
6. Build render commands from visible scene data.
7. Submit command lists to rendering backend.
8. Present frame and collect profiling metrics.

## Resource Pipeline

1. Source asset import (editor/importer stage).
2. Intermediate conversion to engine-native formats.
3. Runtime loading with cache and dependency tracking.
4. Live reload support for tool workflows.

## Error Handling

- Recoverable errors return status objects + diagnostics.
- Fatal initialization errors fail fast with actionable logs.
- Runtime assertions protect invariants in debug builds.

## Instrumentation

- Per-frame timing for update, physics, render, and present.
- Memory allocation counters and leak checks.
- Structured logging categories and levels.
