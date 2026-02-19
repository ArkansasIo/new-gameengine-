# combat_data.gd
# Data model for RPG combat/AI
extends Resource
class_name CombatData

@export var name: String = ""
@export var combat_type: String = ""
@export var power: int = 0
@export var ai_script: String = ""

func to_dict() -> Dictionary:
	return {
		"name": name,
		"combat_type": combat_type,
		"power": power,
		"ai_script": ai_script
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	combat_type = data.get("combat_type", "")
	power = data.get("power", 0)
	ai_script = data.get("ai_script", "")
