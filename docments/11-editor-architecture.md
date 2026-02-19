# Test Game Engine Editor Architecture

## A. Top-Level Shell

- Main Frame / Workspace host with dock regions and tabbed editors.
- Layout presets: `Default`, `Animation`, `Modeling`, `Debug`.
- Global command routing through `CommandService` with context-aware actions.
- Menu Bar, Toolbar quick actions, Editor tabs, Viewports, and Status/Output surfaces.

## Main Menus and Typical Tool Families

- `File`: project/level open-save, import-export, source control entry, exit.
- `Edit`: undo-redo, clipboard actions, preferences, settings, shortcuts.
- `Window`: layout load-save-reset, panel visibility, viewport windows.
- `Tools`: modeling, landscape, blueprint, data and automation tools.
- `Build`: lighting, navigation, shaders, packaging, build all.
- `Play`: PIE, simulate, standalone.
- `Help`: docs, about, bug reporting.

## B. Core Editor Modules (Current Scaffold)

- `editor_core/EditorKernel.gd`: composition root for services.
- `editor_core/EditorApp.gd`: lifecycle + app config.
- `editor_core/CommandService.gd`: action registration + command execution.
- `editor_core/LayoutService.gd`: named layouts and layout switching.
- `editor_core/SelectionService.gd`: selection state and notifications.
- `editor_core/LogService.gd`: log routing for output surfaces.
- `editor_core/EditorEnums.gd`: canonical enums.
- `editor_core/EditorTypes.gd`: shared data builders + menu schema.

## C. Canonical Dockable Panels (Implemented Baseline)

- `ContentBrowser` (left)
- `EditorTabs` with `LevelEditor` + `BlueprintEditor` (center)
- `Details` (right)
- `OutputLog` + `Terminal` (bottom)

## D. API Surface Pattern

- UI widgets dispatch commands to services.
- Services publish events (`layout_changed`, `message_logged`, `selection_changed`).
- Main shell subscribes and updates visual state.

## E. Implemented Practical Baseline

1. AppCore + Docking/Layout shell
2. Command system + keyboard shortcuts
3. Content browser + selection/inspector flow
4. Blueprint graph tab with node spawning
5. Output log service integration

## Next Expansion Targets

1. Asset registry and dependency graph service.
2. Transaction/undo service with scoped records.
3. Viewport subsystem with gizmo/snap modes.
4. Build task scheduler + progress channels.
5. Source control provider abstraction.
