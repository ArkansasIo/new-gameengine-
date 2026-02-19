# CharacterCreatorPanel.gd
extends VBoxContainer
class_name CharacterCreatorPanel

@onready var char_list = null
@onready var char_inspector = null

func _ready():
	self.name = "Character Creator"
	character_list = ItemList.new()
	char_list.custom_minimum_size = Vector2(200, 400)
	char_list.select_mode = ItemList.SELECT_SINGLE
	char_list.item_selected.connect(_on_char_selected)
	add_child(char_list)

	char_inspector = VBoxContainer.new()
	add_child(char_inspector)

	character_list.add_item(character_data.name if character_data.name != "" else "New Character")
	_show_character(character_data.to_dict())

func _on_char_selected(idx):
	_show_character(character_data.to_dict())
	_show_character({"name": "Hero", "class": "Warrior", "level": 1})

func _show_character(data):
	char_inspector.clear()
	for k in data.keys():
		var h = HBoxContainer.new()
		var l = Label.new(); l.text = k+":"; h.add_child(l)
		var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
		char_inspector.add_child(h)

func _save_character_data():
   DataUtils.save_to_json(DATA_PATH, character_data.to_dict())

func _load_character_data():
   var loaded = DataUtils.load_from_json(DATA_PATH)
   if loaded.size() > 0:
	   character_data.from_dict(loaded)

var character_data: CharacterData = CharacterData.new()
const DATA_PATH := "user://character_data.json"
@onready var character_list = null
@onready var character_inspector = null
