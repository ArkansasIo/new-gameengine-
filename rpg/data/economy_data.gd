# economy_data.gd
# Data model for RPG economy/shops
extends Resource
class_name EconomyData

@export var name: String = ""
@export var shop_type: String = ""
@export var currency: String = ""
@export var items: Array = []

func to_dict() -> Dictionary:
	return {
		"name": name,
		"shop_type": shop_type,
		"currency": currency,
		"items": items
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	shop_type = data.get("shop_type", "")
	currency = data.get("currency", "")
	items = data.get("items", [])
