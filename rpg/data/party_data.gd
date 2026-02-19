# party_data.gd
# Data model for RPG parties/raids
extends Resource
class_name PartyData

@export var name: String = ""
@export var party_type: String = ""
@export var members: Array = []

func to_dict() -> Dictionary:
	return {
		"name": name,
		"party_type": party_type,
		"members": members
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	party_type = data.get("party_type", "")
	members = data.get("members", [])
