extends RefCounted
class_name EditorApp

var app_config: Dictionary = {}
var is_initialized := false

func initialize(config: Dictionary) -> void:
	app_config = config.duplicate(true)
	is_initialized = true

func shutdown() -> void:
	is_initialized = false

func get_project_name() -> String:
	return app_config.get("project_name", "Test Game Engine")
