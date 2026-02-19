# data_utils.gd
# Utility functions for saving/loading RPG/MMO data models as JSON
extends Node
class_name DataUtils

static func save_to_json(path: String, data: Dictionary) -> void:
	var file = FileAccess.open(path, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data, "\t"))
		file.close()

static func load_from_json(path: String) -> Dictionary:
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var text = file.get_as_text()
		file.close()
		var result = JSON.parse_string(text)
		if typeof(result) == TYPE_DICTIONARY:
			return result
	return {}
