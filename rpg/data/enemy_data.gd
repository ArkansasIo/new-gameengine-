# enemy_data.gd
# Data model for RPG enemies/NPCs
extends Resource
class_name EnemyData

@export var name: String = ""
@export var enemy_type: String = ""
@export var hp: int = 0
@export var drops: Array = []

func to_dict() -> Dictionary:
	return {
		"name": name,
		"enemy_type": enemy_type,
		"hp": hp,
		"drops": drops
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	enemy_type = data.get("enemy_type", "")
	hp = data.get("hp", 0)
	drops = data.get("drops", [])
