# QuestPanel.gd
extends VBoxContainer
class_name QuestPanel

@onready var quest_list = null
@onready var quest_inspector = null

var quest_data: QuestData = QuestData.new()
const DATA_PATH := "user://quest_data.json"

func _ready():
	self.name = "Quest/Dialogue Editor"
	quest_list = ItemList.new()
	quest_list.custom_minimum_size = Vector2(200, 400)
	quest_list.select_mode = ItemList.SELECT_SINGLE
	quest_list.item_selected.connect(_on_quest_selected)
	add_child(quest_list)

	quest_inspector = VBoxContainer.new()
	add_child(quest_inspector)

	_load_quest_data()
	quest_list.add_item(quest_data.name if quest_data.name != "" else "Find the Sword")
	_show_quest(quest_data.to_dict())

func _on_quest_selected(idx):
	_show_quest(quest_data.to_dict())

func _show_quest(data):
   quest_inspector.clear()
   for k in data.keys():
	   var h = HBoxContainer.new()
	   var l = Label.new(); l.text = k+":"; h.add_child(l)
	   var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
	   v.editable = true
	   v.text_changed.connect(func(new_text):
		   quest_data.set(k, new_text)
		   _save_quest_data()
	   )
	   quest_inspector.add_child(h)

func _save_quest_data():
   DataUtils.save_to_json(DATA_PATH, quest_data.to_dict())

func _load_quest_data():
   var loaded = DataUtils.load_from_json(DATA_PATH)
   if loaded.size() > 0:
	   quest_data.from_dict(loaded)
