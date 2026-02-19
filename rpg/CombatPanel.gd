# CombatPanel.gd
extends VBoxContainer
class_name CombatPanel

@onready var combat_list = null
@onready var combat_inspector = null

var combat_data: CombatData = CombatData.new()
const DATA_PATH := "user://combat_data.json"

func _ready():
	self.name = "Combat/AI Designer"
	combat_list = ItemList.new()
	combat_list.custom_minimum_size = Vector2(200, 400)
	combat_list.select_mode = ItemList.SELECT_SINGLE
	combat_list.item_selected.connect(_on_combat_selected)
	add_child(combat_list)

	combat_inspector = VBoxContainer.new()
	add_child(combat_inspector)

	_load_combat_data()
	combat_list.add_item(combat_data.name if combat_data.name != "" else "Basic Attack")
	_show_combat(combat_data.to_dict())

func _on_combat_selected(idx):
	_show_combat(combat_data.to_dict())

func _show_combat(data):
   combat_inspector.clear()
   for k in data.keys():
	   var h = HBoxContainer.new()
	   var l = Label.new(); l.text = k+":"; h.add_child(l)
	   var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
	   v.editable = true
	   v.text_changed.connect(func(new_text):
		   combat_data.set(k, new_text)
		   _save_combat_data()
	   )
	   combat_inspector.add_child(h)

func _save_combat_data():
   DataUtils.save_to_json(DATA_PATH, combat_data.to_dict())

func _load_combat_data():
   var loaded = DataUtils.load_from_json(DATA_PATH)
   if loaded.size() > 0:
	   combat_data.from_dict(loaded)
