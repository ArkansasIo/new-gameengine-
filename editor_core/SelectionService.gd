extends RefCounted
class_name SelectionService

signal selection_changed(selection: Dictionary)

var _selection: Dictionary = {
	"kind": 0,
	"ids": [],
	"primary_id": "",
}

func set_selection(kind: int, ids: Array, primary_id: String = "") -> void:
	_selection = {
		"kind": kind,
		"ids": ids.duplicate(),
		"primary_id": primary_id,
	}
	emit_signal("selection_changed", _selection)

func clear_selection() -> void:
	set_selection(0, [], "")

func get_selection() -> Dictionary:
	return _selection.duplicate(true)

func has_selection() -> bool:
	return _selection["ids"].size() > 0
