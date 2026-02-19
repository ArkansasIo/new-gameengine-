# WorldPanel.gd
extends VBoxContainer
class_name WorldPanel

@onready var map_list = null
@onready var map_inspector = null

func _ready():
	self.name = "World/Map Editor"
	map_list = ItemList.new()
	map_list.custom_minimum_size = Vector2(200, 400)
	map_list.select_mode = ItemList.SELECT_SINGLE
	map_list.item_selected.connect(_on_map_selected)
	add_child(map_list)

	map_inspector = VBoxContainer.new()
	add_child(map_inspector)

	map_list.add_item("Start Village")
	_show_map({"name": "Start Village", "type": "Village", "level": 1})

func _on_map_selected(idx):
	_show_map({"name": "Start Village", "type": "Village", "level": 1})

func _show_map(data):
	map_inspector.clear()
	for k in data.keys():
		var h = HBoxContainer.new()
		var l = Label.new(); l.text = k+":"; h.add_child(l)
		var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
		map_inspector.add_child(h)
