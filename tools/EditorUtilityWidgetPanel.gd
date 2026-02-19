extends Panel

# Editor Utility Widget UI logic

@onready var vbox = $VBoxContainer

func _ready():
	populate_widgets()

func populate_widgets():
	vbox.clear()
	var label = Label.new()
	label.text = "Utility Actions:"
	vbox.add_child(label)
	# Add more utility widget controls here
