extends Panel

# AI Chat Widget logic

@onready var chat_history = $VBoxContainer/ChatHistory
@onready var chat_input = $VBoxContainer/HBoxContainer/ChatInput
@onready var send_button = $VBoxContainer/HBoxContainer/SendButton

func _ready():
	chat_history.text = "Welcome to the AI Chat!\n"
	send_button.pressed.connect(_on_send_pressed)
	chat_input.connect("text_submitted", self, "_on_send_pressed")

func _on_send_pressed():
	var user_text = chat_input.text.strip_edges()
	if user_text == "":
		return
	chat_history.text += "You: " + user_text + "\n"
	chat_input.text = ""
	# Simulate AI response
	var ai_response = _generate_ai_response(user_text)
	chat_history.text += "AI: " + ai_response + "\n"

func _generate_ai_response(user_text):
	# Placeholder for AI logic
	return "(AI response to: '" + user_text + "')"
