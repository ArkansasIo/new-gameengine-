# EconomyPanel.gd
extends VBoxContainer
class_name EconomyPanel

@onready var shop_list = null
@onready var shop_inspector = null

var economy_data: EconomyData = EconomyData.new()
const DATA_PATH := "user://economy_data.json"

func _ready():
	self.name = "Economy/Shop Editor"
	shop_list = ItemList.new()
	shop_list.custom_minimum_size = Vector2(200, 400)
	shop_list.select_mode = ItemList.SELECT_SINGLE
	shop_list.item_selected.connect(_on_shop_selected)
	add_child(shop_list)

	shop_inspector = VBoxContainer.new()
	add_child(shop_inspector)

	_load_economy_data()
	shop_list.add_item(economy_data.name if economy_data.name != "" else "Potion Shop")
	_show_shop(economy_data.to_dict())

func _on_shop_selected(idx):
	_show_shop(economy_data.to_dict())

func _show_shop(data):
   shop_inspector.clear()
   for k in data.keys():
	   var h = HBoxContainer.new()
	   var l = Label.new(); l.text = k+":"; h.add_child(l)
	   var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
	   v.editable = true
	   v.text_changed.connect(func(new_text):
		   economy_data.set(k, new_text)
		   _save_economy_data()
	   )
	   shop_inspector.add_child(h)

func _save_economy_data():
   DataUtils.save_to_json(DATA_PATH, economy_data.to_dict())

func _load_economy_data():
   var loaded = DataUtils.load_from_json(DATA_PATH)
   if loaded.size() > 0:
	   economy_data.from_dict(loaded)
