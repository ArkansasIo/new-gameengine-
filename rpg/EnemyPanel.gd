# EnemyPanel.gd
extends VBoxContainer
class_name EnemyPanel

@onready var enemy_list = null
@onready var enemy_inspector = null

var enemy_data: EnemyData = EnemyData.new()
const DATA_PATH := "user://enemy_data.json"

func _ready():
	self.name = "Enemy/NPC Editor"
	enemy_list = ItemList.new()
	enemy_list.custom_minimum_size = Vector2(200, 400)
	enemy_list.select_mode = ItemList.SELECT_SINGLE
	enemy_list.item_selected.connect(_on_enemy_selected)
	add_child(enemy_list)

	enemy_inspector = VBoxContainer.new()
	add_child(enemy_inspector)

	_load_enemy_data()
	enemy_list.add_item(enemy_data.name if enemy_data.name != "" else "Goblin")
	_show_enemy(enemy_data.to_dict())

func _on_enemy_selected(idx):
	_show_enemy(enemy_data.to_dict())

func _show_enemy(data):
   enemy_inspector.clear()
   for k in data.keys():
	   var h = HBoxContainer.new()
	   var l = Label.new(); l.text = k+":"; h.add_child(l)
	   var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
	   v.editable = true
	   v.text_changed.connect(func(new_text):
		   enemy_data.set(k, new_text)
		   _save_enemy_data()
	   )
	   enemy_inspector.add_child(h)

func _save_enemy_data():
   DataUtils.save_to_json(DATA_PATH, enemy_data.to_dict())

func _load_enemy_data():
   var loaded = DataUtils.load_from_json(DATA_PATH)
   if loaded.size() > 0:
	   enemy_data.from_dict(loaded)
