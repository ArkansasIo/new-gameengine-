extends Panel

# Settings Panel UI logic

@onready var tab_container = $TabContainer
@onready var world_settings = $TabContainer/WorldSettings
@onready var project_settings = $TabContainer/ProjectSettings

func _ready():
	populate_world_settings()
	populate_project_settings()

func populate_world_settings():
	world_settings.clear()
	var label = Label.new()
	label.text = "World Settings:"
	world_settings.add_child(label)
	# Add more world settings controls here

func populate_project_settings():
	project_settings.clear()
	var label = Label.new()
	label.text = "Project Settings:"
	project_settings.add_child(label)
	# Add more project settings controls here
