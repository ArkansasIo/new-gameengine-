extends Panel

# Details Panel UI logic

@onready var vbox = $VBoxContainer

func _ready():
	populate_details()

func populate_details():
	# Example: Show dummy actor details
	vbox.clear()
	var label = Label.new()
	label.text = "Actor Details:"
	vbox.add_child(label)
	for prop in ["Location", "Rotation", "Scale"]:
		var prop_label = Label.new()
		prop_label.text = prop + ": (0,0,0)"
		vbox.add_child(prop_label)

func edit_actor_property(actor_name, property, value):
	# Stub: Edit actor property
	print("Editing %s: %s = %s" % [actor_name, property, value])
