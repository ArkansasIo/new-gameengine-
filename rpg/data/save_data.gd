# save_data.gd
# Data model for RPG save/load/export
extends Resource
class_name SaveData

@export var name: String = ""
@export var timestamp: String = ""
@export var player: String = ""
@export var data: Dictionary = {}

func to_dict() -> Dictionary:
	return {
		"name": name,
		"timestamp": timestamp,
		"player": player,
		"data": data
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	timestamp = data.get("timestamp", "")
	player = data.get("player", "")
	self.data = data.get("data", {})
