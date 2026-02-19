# VariableSetNode.gd
# Blueprint node: Set variable value
extends "res://BlueprintNodeBase.gd"

@export var var_name: String = "var"

func _init():
    node_title = "Set Var"
    input_pins = [{"name": "Value", "type": PinType.FLOAT}]
    output_pins = [{"name": "Done", "type": PinType.EXEC}]

func _build_ui():
    var label = Label.new()
    label.text = "Set " + var_name
    add_child(label)

func execute(inputs):
    # Placeholder: set dummy value
    return {"Done": true}
