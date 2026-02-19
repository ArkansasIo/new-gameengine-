# skill_data.gd
# Data model for RPG skills
extends Resource
class_name SkillData

@export var name: String = ""
@export var skill_type: String = ""
@export var damage: int = 0
@export var cooldown: float = 0.0

func to_dict() -> Dictionary:
	return {
		"name": name,
		"skill_type": skill_type,
		"damage": damage,
		"cooldown": cooldown
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	skill_type = data.get("skill_type", "")
	damage = data.get("damage", 0)
	cooldown = data.get("cooldown", 0.0)
