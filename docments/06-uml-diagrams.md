# UML Diagrams

The following Mermaid diagrams describe the main structural and runtime relationships.

## Layered Architecture

```mermaid
flowchart TD
    P[Platform] --> C[Core]
    C --> S[Servers]
    S --> SC[Scene]
    SC --> E[Editor]
    M[Optional Modules] --> C
    M --> S
    M --> SC
```

## Core Class Relationships

```mermaid
classDiagram
    class Object {
      +ObjectID id
      +get_class()
      +set(property, value)
      +get(property)
    }

    class Resource {
      +String path
      +load()
      +save()
    }

    class Node {
      +StringName name
      +_enter_tree()
      +_process(delta)
      +_exit_tree()
    }

    class SceneTree {
      +Node root
      +iteration(delta)
    }

    class RenderServer {
      <<interface>>
      +submit_commands()
    }

    Object <|-- Resource
    Object <|-- Node
    SceneTree o-- Node
    Node --> RenderServer
```

## Frame Sequence

```mermaid
sequenceDiagram
    participant OS as Platform
    participant Main as MainLoop
    participant Scene as SceneTree
    participant Phys as PhysicsServer
    participant Rend as RenderServer

    OS->>Main: events + timing
    Main->>Scene: input dispatch
    Main->>Phys: fixed_step()
    Main->>Scene: process(delta)
    Scene->>Rend: build draw commands
    Main->>Rend: submit + present
```

## Asset Import Flow

```mermaid
flowchart LR
    A[Source Asset] --> I[Importer]
    I --> F[Engine Format]
    F --> C[Resource Cache]
    C --> R[Runtime Loader]
    R --> S[Scene/Systems]
```
