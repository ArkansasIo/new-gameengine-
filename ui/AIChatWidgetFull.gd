extends Panel

# Full AI Chat Widget logic with command routing

@onready var chat_history = $VBoxContainer/ChatHistory
@onready var chat_input = $VBoxContainer/HBoxContainer/ChatInput
@onready var send_button = $VBoxContainer/HBoxContainer/SendButton
@onready var command_list = $VBoxContainer/CommandList

var commands = {
	"help": "Show available commands",
	"list_assets": "List assets in Content Browser",
	"batch_rename": "Batch rename assets (Python)",
	"show_actors": "Show actors in World Outliner",
	"edit_actor": "Edit actor properties",
	"run_script": "Run a Python automation script"
}

func _ready():
	chat_history.text = "Welcome to the AI Chat!\n"
	for cmd in commands.keys():
		command_list.add_item(cmd + ": " + commands[cmd])
	send_button.pressed.connect(_on_send_pressed)
	chat_input.connect("text_submitted", self, "_on_send_pressed")

func _on_send_pressed():
	var user_text = chat_input.text.strip_edges()
	if user_text == "":
		return
	chat_history.text += "You: " + user_text + "\n"
	chat_input.text = ""
	var ai_response = _route_command(user_text)
	chat_history.text += "AI: " + ai_response + "\n"

func _route_command(user_text):
	var tokens = user_text.split(" ")
	var cmd = tokens[0]
	match cmd:
		"help":
			return _help_response()
		"list_assets":
			return _list_assets_response()
		"batch_rename":
			return _batch_rename_response(tokens)
		"show_actors":
			return _show_actors_response()
		"edit_actor":
			return _edit_actor_response(tokens)
		"run_script":
			return _run_script_response(tokens)
		_:
			return "Unknown command. Type 'help' for options."

func _help_response():
	return "Available commands:\n" + commands.keys().join("\n")

func _list_assets_response():
	# Integrate with ContentBrowserManager
	var cbm = get_node_or_null("/root/ContentBrowserManager")
	if cbm and cbm.has_method("get_asset_list"):
		return "Assets: " + cbm.get_asset_list().join(", ")
	return "ContentBrowserManager not available."

func _batch_rename_response(tokens):
	# Integrate with PythonAutomationManager
	if tokens.size() < 2:
		return "Usage: batch_rename <prefix>"
	var pam = get_node_or_null("/root/PythonAutomationManager")
	if pam and pam.has_method("batch_rename_assets"):
		pam.batch_rename_assets("../editor", tokens[1])
		return "Batch renaming assets with prefix '" + tokens[1] + "'"
	return "PythonAutomationManager not available."

func _show_actors_response():
	# Integrate with WorldOutlinerPanel
	var wop = get_node_or_null("/root/WorldOutlinerPanel")
	if wop and wop.has_method("get_actor_list"):
		return "Actors: " + wop.get_actor_list().join(", ")
	return "WorldOutlinerPanel not available."

func _edit_actor_response(tokens):
	# Integrate with DetailsPanel
	if tokens.size() < 4:
		return "Usage: edit_actor <actor_name> <property> <value>"
	var dp = get_node_or_null("/root/DetailsPanel")
	if dp and dp.has_method("edit_actor_property"):
		dp.edit_actor_property(tokens[1], tokens[2], tokens[3])
		return "Editing actor '" + tokens[1] + "', setting '" + tokens[2] + "' to '" + tokens[3] + "'"
	return "DetailsPanel not available."

func _run_script_response(tokens):
	# Integrate with Python scripts
	if tokens.size() < 2:
		return "Usage: run_script <script_name>"
	var pam = get_node_or_null("/root/PythonAutomationManager")
	if pam and pam.has_method("run_script"):
		pam.run_script(tokens[1])
		return "Running script '" + tokens[1] + "'"
	return "PythonAutomationManager not available."
