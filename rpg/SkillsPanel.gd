# SkillsPanel.gd
extends VBoxContainer
class_name SkillsPanel

@onready var skill_list = null
@onready var skill_inspector = null

var skill_data: SkillData = SkillData.new()
const DATA_PATH := "user://skill_data.json"

func _ready():
	self.name = "Skills/Abilities Editor"
	skill_list = ItemList.new()
	skill_list.custom_minimum_size = Vector2(200, 400)
	skill_list.select_mode = ItemList.SELECT_SINGLE
	skill_list.item_selected.connect(_on_skill_selected)
	add_child(skill_list)

	skill_inspector = VBoxContainer.new()
	add_child(skill_inspector)

	_load_skill_data()
	skill_list.add_item(skill_data.name if skill_data.name != "" else "Fireball")
	_show_skill(skill_data.to_dict())

func _on_skill_selected(idx):
	_show_skill(skill_data.to_dict())

func _show_skill(data):
   skill_inspector.clear()
   for k in data.keys():
	   var h = HBoxContainer.new()
	   var l = Label.new(); l.text = k+":"; h.add_child(l)
	   var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
	   v.editable = true
	   v.text_changed.connect(func(new_text):
		   skill_data.set(k, new_text)
		   _save_skill_data()
	   )
	   skill_inspector.add_child(h)

func _save_skill_data():
   DataUtils.save_to_json(DATA_PATH, skill_data.to_dict())

func _load_skill_data():
   var loaded = DataUtils.load_from_json(DATA_PATH)
   if loaded.size() > 0:
	   skill_data.from_dict(loaded)
