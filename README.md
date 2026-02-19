# Test Game Engine

## Documentation

Full engine design and architecture documents are available in [`docments/`](docments/README.md):

- [Engine Overview](docments/01-engine-overview.md)
- [System Architecture](docments/02-system-architecture.md)
- [Runtime Pipeline](docments/03-runtime-pipeline.md)
- [Module Design](docments/04-module-design.md)
- [Class Design](docments/05-class-design.md)
- [UML Diagrams](docments/06-uml-diagrams.md)
- [GEDD: Game Engine Design Document](docments/07-gedd-game-engine-design-document.md)
- [API Design Guidelines](docments/08-api-design-guidelines.md)
- [Testing and Quality Strategy](docments/09-testing-quality.md)
- [Release and Roadmap](docments/10-release-roadmap.md)

## Compile Progress Script

Use `compile_with_progress.ps1` to compile with a terminal loading bar from `0%` to `100%`.

```powershell
.\compile_with_progress.ps1
```

Example with explicit build options:

```powershell
.\compile_with_progress.ps1 -Platform windows -Target editor -Arch x86_64 -Jobs 12
```

Pass extra SCons arguments:

```powershell
.\compile_with_progress.ps1 -SconsArgs @("precision=double", "dev_build=yes")
```
