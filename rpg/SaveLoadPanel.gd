# SaveLoadPanel.gd
extends VBoxContainer
class_name SaveLoadPanel

@onready var save_list = null
@onready var save_inspector = null

func _ready():
	self.name = "Save/Load/Export Tools"
	save_list = ItemList.new()
	save_list.custom_minimum_size = Vector2(200, 400)
	save_list.select_mode = ItemList.SELECT_SINGLE
	save_list.item_selected.connect(_on_save_selected)
	add_child(save_list)

	save_inspector = VBoxContainer.new()
	add_child(save_inspector)

	save_list.add_item("Save Slot 1")
	_show_save({"name": "Save Slot 1", "timestamp": "2026-02-19", "player": "Hero"})

func _on_save_selected(idx):
	_show_save({"name": "Save Slot 1", "timestamp": "2026-02-19", "player": "Hero"})

func _show_save(data):
	save_inspector.clear()
	for k in data.keys():
		var h = HBoxContainer.new()
		var l = Label.new(); l.text = k+":"; h.add_child(l)
		var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
		save_inspector.add_child(h)
