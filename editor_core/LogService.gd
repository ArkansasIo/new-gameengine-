extends RefCounted
class_name LogService

signal message_logged(level: String, message: String)

var _lines: Array[String] = []
var _max_lines: int = 2000

func set_max_lines(max_lines: int) -> void:
	_max_lines = max(100, max_lines)

func log_info(message: String) -> void:
	_log("INFO", message)

func log_warn(message: String) -> void:
	_log("WARN", message)

func log_error(message: String) -> void:
	_log("ERROR", message)

func get_lines() -> Array[String]:
	return _lines.duplicate()

func _log(level: String, message: String) -> void:
	var line := "[%s] %s" % [level, message]
	_lines.append(line)
	if _lines.size() > _max_lines:
		_lines.pop_front()
	emit_signal("message_logged", level, message)
