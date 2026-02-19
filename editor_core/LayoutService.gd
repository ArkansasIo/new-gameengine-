extends RefCounted
class_name LayoutService

signal layout_changed(layout_name: String)

var _active_layout: String = "Default"
var _layouts: Dictionary = {
	"Default": {},
	"Animation": {},
	"Modeling": {},
	"Debug": {},
}

func register_layout(layout_name: String, layout_data: Dictionary = {}) -> void:
	_layouts[layout_name] = layout_data.duplicate(true)

func set_active_layout(layout_name: String) -> void:
	if not _layouts.has(layout_name):
		return
	_active_layout = layout_name
	emit_signal("layout_changed", layout_name)

func get_active_layout() -> String:
	return _active_layout

func get_layouts() -> Array:
	return _layouts.keys()

func save_layout(layout_name: String, layout_data: Dictionary) -> void:
	_layouts[layout_name] = layout_data.duplicate(true)
