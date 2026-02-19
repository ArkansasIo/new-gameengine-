# FactionPanel.gd
extends VBoxContainer
class_name FactionPanel

@onready var faction_list = null
@onready var faction_inspector = null

var faction_data: FactionData = FactionData.new()
const DATA_PATH := "user://faction_data.json"

func _ready():
	self.name = "Faction/Guild System"
	faction_list = ItemList.new()
	faction_list.custom_minimum_size = Vector2(200, 400)
	faction_list.select_mode = ItemList.SELECT_SINGLE
	faction_list.item_selected.connect(_on_faction_selected)
	add_child(faction_list)

	faction_inspector = VBoxContainer.new()
	add_child(faction_inspector)

	_load_faction_data()
	faction_list.add_item(faction_data.name if faction_data.name != "" else "Wolves")
	_show_faction(faction_data.to_dict())

func _on_faction_selected(idx):
	_show_faction(faction_data.to_dict())

func _show_faction(data):
   faction_inspector.clear()
   for k in data.keys():
	   var h = HBoxContainer.new()
	   var l = Label.new(); l.text = k+":"; h.add_child(l)
	   var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
	   v.editable = true
	   v.text_changed.connect(func(new_text):
		   faction_data.set(k, new_text)
		   _save_faction_data()
	   )
	   faction_inspector.add_child(h)

func _save_faction_data():
   DataUtils.save_to_json(DATA_PATH, faction_data.to_dict())

func _load_faction_data():
   var loaded = DataUtils.load_from_json(DATA_PATH)
   if loaded.size() > 0:
	   faction_data.from_dict(loaded)
