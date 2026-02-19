# PartyPanel.gd
extends VBoxContainer
class_name PartyPanel

@onready var party_list = null
@onready var party_inspector = null

var party_data: PartyData = PartyData.new()
const DATA_PATH := "user://party_data.json"

func _ready():
	self.name = "Party/Raid System"
	party_list = ItemList.new()
	party_list.custom_minimum_size = Vector2(200, 400)
	party_list.select_mode = ItemList.SELECT_SINGLE
	party_list.item_selected.connect(_on_party_selected)
	add_child(party_list)

	party_inspector = VBoxContainer.new()
	add_child(party_inspector)

	_load_party_data()
	party_list.add_item(party_data.name if party_data.name != "" else "Alpha Team")
	_show_party(party_data.to_dict())

func _on_party_selected(idx):
	_show_party(party_data.to_dict())

func _show_party(data):
   party_inspector.clear()
   for k in data.keys():
	   var h = HBoxContainer.new()
	   var l = Label.new(); l.text = k+":"; h.add_child(l)
	   var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
	   v.editable = true
	   v.text_changed.connect(func(new_text):
		   party_data.set(k, new_text)
		   _save_party_data()
	   )
	   party_inspector.add_child(h)

func _save_party_data():
   DataUtils.save_to_json(DATA_PATH, party_data.to_dict())

func _load_party_data():
   var loaded = DataUtils.load_from_json(DATA_PATH)
   if loaded.size() > 0:
	   party_data.from_dict(loaded)
