# AI Chat Widget Full Integration

This widget enables text-based interaction with all major game engine systems and tools:

- Asset management (ContentBrowserManager)
- World editing (WorldOutlinerPanel)
- Actor property editing (DetailsPanel)
- Python automation and batch operations (PythonAutomationManager)

## Usage

1. Add `AIChatWidgetFull.tscn` to your editor scene.
2. Ensure manager nodes are available as singletons or at `/root`.
3. Use chat commands:
   - `help`: List available commands
   - `list_assets`: Show asset list
   - `batch_rename <prefix>`: Batch rename assets
   - `show_actors`: List actors
   - `edit_actor <actor_name> <property> <value>`: Edit actor property
   - `run_script <script_name>`: Run a Python script

## Extending

- Add more commands and connect to additional manager scripts.
- Replace stub methods with real operations for live engine control.
- Integrate with external AI APIs for advanced chat features.
