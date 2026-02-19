extends Panel

# Content Browser UI logic

@onready var file_tree = $FileSystem

func _ready():
	populate_files()

func populate_files():
	# Example: Populate with dummy files
	var root = file_tree.create_item()
	for name in ["Texture.png", "Mesh.obj", "Script.gd", "Audio.wav"]:
		var item = file_tree.create_item(root)
		item.set_text(0, name)
