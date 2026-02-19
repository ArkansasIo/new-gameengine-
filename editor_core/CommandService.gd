extends RefCounted
class_name CommandService

signal command_executed(command_id: String)

var _commands: Dictionary = {}

func register_command(command_info: Dictionary, callback: Callable) -> void:
	if not command_info.has("id"):
		return
	var id: String = command_info["id"]
	_commands[id] = {
		"info": command_info,
		"callback": callback,
	}

func execute_command(command_id: String) -> bool:
	if not _commands.has(command_id):
		return false
	var entry: Dictionary = _commands[command_id]
	var callback: Callable = entry["callback"]
	if callback.is_valid():
		callback.call()
		emit_signal("command_executed", command_id)
		return true
	return false

func has_command(command_id: String) -> bool:
	return _commands.has(command_id)

func list_command_ids() -> Array:
	return _commands.keys()

func get_command_info(command_id: String) -> Dictionary:
	if not _commands.has(command_id):
		return {}
	return _commands[command_id]["info"]
