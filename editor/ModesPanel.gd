extends Panel

# Modes Panel UI logic

@onready var modeling_btn = $HBoxContainer/ModelingButton
@onready var landscape_btn = $HBoxContainer/LandscapeButton
@onready var foliage_btn = $HBoxContainer/FoliageButton

func _ready():
	modeling_btn.pressed.connect(_on_modeling_pressed)
	landscape_btn.pressed.connect(_on_landscape_pressed)
	foliage_btn.pressed.connect(_on_foliage_pressed)

func _on_modeling_pressed():
	print("Modeling mode activated")

func _on_landscape_pressed():
	print("Landscape mode activated")

func _on_foliage_pressed():
	print("Foliage mode activated")
