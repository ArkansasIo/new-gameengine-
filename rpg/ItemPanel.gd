# ItemPanel.gd
extends VBoxContainer
class_name ItemPanel

@onready var item_list = null
@onready var item_inspector = null

var item_data: ItemData = ItemData.new()
const DATA_PATH := "user://item_data.json"

func _ready():
	self.name = "Item/Drop Table Editor"
	item_list = ItemList.new()
	item_list.custom_minimum_size = Vector2(200, 400)
	item_list.select_mode = ItemList.SELECT_SINGLE
	item_list.item_selected.connect(_on_item_selected)
	add_child(item_list)

	item_inspector = VBoxContainer.new()
	add_child(item_inspector)

	_load_item_data()
	item_list.add_item(item_data.name if item_data.name != "" else "Potion")
	_show_item(item_data.to_dict())

func _on_item_selected(idx):
	_show_item(item_data.to_dict())

func _show_item(data):
   item_inspector.clear()
   for k in data.keys():
	   var h = HBoxContainer.new()
	   var l = Label.new(); l.text = k+":"; h.add_child(l)
	   var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
	   v.editable = true
	   v.text_changed.connect(func(new_text):
		   item_data.set(k, new_text)
		   _save_item_data()
	   )
	   item_inspector.add_child(h)

func _save_item_data():
   DataUtils.save_to_json(DATA_PATH, item_data.to_dict())

func _load_item_data():
   var loaded = DataUtils.load_from_json(DATA_PATH)
   if loaded.size() > 0:
	   item_data.from_dict(loaded)
