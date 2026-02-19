extends Panel

# World Outliner UI logic

@onready var tree = $Tree

func _ready():
	populate_tree()

func populate_tree():
	# Example: Populate with dummy actors
	var root = tree.create_item()
	for i in range(5):
		var item = tree.create_item(root)
		item.set_text(0, "Actor %d" % i)

func get_actor_list():
	# Return a list of actor names (stub)
	var actors = []
	for i in range(5):
		actors.append("Actor %d" % i)
	return actors
