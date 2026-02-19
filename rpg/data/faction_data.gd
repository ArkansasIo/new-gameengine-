# faction_data.gd
# Data model for RPG factions/guilds
extends Resource
class_name FactionData

@export var name: String = ""
@export var faction_type: String = ""
@export var reputation: int = 0
@export var members: Array = []

func to_dict() -> Dictionary:
	return {
		"name": name,
		"faction_type": faction_type,
		"reputation": reputation,
		"members": members
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	faction_type = data.get("faction_type", "")
	reputation = data.get("reputation", 0)
	members = data.get("members", [])
