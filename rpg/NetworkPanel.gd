# NetworkPanel.gd
extends VBoxContainer
class_name NetworkPanel

@onready var server_list = null
@onready var server_inspector = null

var network_data: NetworkData = NetworkData.new()
const DATA_PATH := "user://network_data.json"

func _ready():
	self.name = "Network/Server Tools"
	server_list = ItemList.new()
	server_list.custom_minimum_size = Vector2(200, 400)
	server_list.select_mode = ItemList.SELECT_SINGLE
	server_list.item_selected.connect(_on_server_selected)
	add_child(server_list)

	server_inspector = VBoxContainer.new()
	add_child(server_inspector)

	_load_network_data()
	server_list.add_item(network_data.name if network_data.name != "" else "Main Server")
	_show_server(network_data.to_dict())

func _on_server_selected(idx):
	_show_server(network_data.to_dict())

func _show_server(data):
   server_inspector.clear()
   for k in data.keys():
	   var h = HBoxContainer.new()
	   var l = Label.new(); l.text = k+":"; h.add_child(l)
	   var v = LineEdit.new(); v.text = str(data[k]); h.add_child(v)
	   v.editable = true
	   v.text_changed.connect(func(new_text):
		   network_data.set(k, new_text)
		   _save_network_data()
	   )
	   server_inspector.add_child(h)

func _save_network_data():
   DataUtils.save_to_json(DATA_PATH, network_data.to_dict())

func _load_network_data():
   var loaded = DataUtils.load_from_json(DATA_PATH)
   if loaded.size() > 0:
	   network_data.from_dict(loaded)
