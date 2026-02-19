# inventory_data.gd
# Data model for RPG inventory
extends Resource
class_name InventoryData

@export var items: Array = []

func to_dict() -> Dictionary:
	return {"items": items}

func from_dict(data: Dictionary):
	items = data.get("items", [])

func add_item(item: Dictionary):
	items.append(item)

func remove_item(item_name: String):
	for i in range(items.size()):
		if items[i].get("name", "") == item_name:
			items.remove_at(i)
			break
