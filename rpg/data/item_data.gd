# item_data.gd
# Data model for RPG items
extends Resource
class_name ItemData

@export var name: String = ""
@export var item_type: String = ""
@export var effect: String = ""
@export var value: int = 0

func to_dict() -> Dictionary:
	return {
		"name": name,
		"item_type": item_type,
		"effect": effect,
		"value": value
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	item_type = data.get("item_type", "")
	effect = data.get("effect", "")
	value = data.get("value", 0)
