# InventoryPanel.gd
extends VBoxContainer
class_name InventoryPanel

@onready var item_list = null
@onready var item_inspector = null

func _ready():
	self.name = "Inventory/Equipment Editor"
	inventory_list = ItemList.new()
	item_list.custom_minimum_size = Vector2(200, 400)
	item_list.select_mode = ItemList.SELECT_SINGLE
	item_list.item_selected.connect(_on_item_selected)
	add_child(item_list)

	item_inspector = VBoxContainer.new()
	add_child(item_inspector)

	inventory_list.add_item("Main Inventory")
	_load_inventory_data()
	_show_inventory(inventory_data.to_dict())
	_show_item({"name": "Sword", "type": "Weapon", "power": 10})

func _on_item_selected(idx):
	_show_inventory(inventory_data.to_dict())

func _show_item(data):
	item_inspector.clear()
	for k in data.keys():
		var h = HBoxContainer.new()
		var l = Label.new(); l.text = k+":"; h.add_child(l)
		var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
		item_inspector.add_child(h)

func _save_inventory_data():
	DataUtils.save_to_json(DATA_PATH, inventory_data.to_dict())

func _load_inventory_data():
	var loaded = DataUtils.load_from_json(DATA_PATH)
	if loaded.size() > 0:
		inventory_data.from_dict(loaded)

var inventory_data: InventoryData = InventoryData.new()
const DATA_PATH := "user://inventory_data.json"

@onready var inventory_inspector = null
