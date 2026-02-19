# BlueprintScriptNode.gd
# Node for script logic in the blueprint system
extends "res://BlueprintNode.gd"

@export var script_code: String = ""

func _ready():
    ._ready()
    var script_edit = TextEdit.new()
    script_edit.text = script_code
    script_edit.size_flags_vertical = Control.SIZE_EXPAND_FILL
    script_edit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    script_edit.custom_minimum_size = Vector2(180, 80)
    script_edit.text_changed.connect(_on_script_changed.bind(script_edit))
    add_child(script_edit)

func _on_script_changed(script_edit: TextEdit):
    script_code = script_edit.text
