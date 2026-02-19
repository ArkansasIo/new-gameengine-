# character_data.gd
# Data model for RPG characters
extends Resource
class_name CharacterData

@export var name: String = ""
@export var char_class: String = ""
@export var level: int = 1
@export var stats: Dictionary = {}
@export var inventory: Array = []
@export var skills: Array = []

func to_dict() -> Dictionary:
	return {
		"name": name,
		"char_class": char_class,
		"level": level,
		"stats": stats,
		"inventory": inventory,
		"skills": skills
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	char_class = data.get("char_class", "")
	level = data.get("level", 1)
	stats = data.get("stats", {})
	inventory = data.get("inventory", [])
	skills = data.get("skills", [])
