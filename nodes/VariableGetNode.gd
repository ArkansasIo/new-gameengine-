# VariableGetNode.gd
# Blueprint node: Get variable value
extends "res://BlueprintNodeBase.gd"

@export var var_name: String = "var"

func _init():
    node_title = "Get Var"
    input_pins = []
    output_pins = [{"name": "Value", "type": PinType.FLOAT}]

func _build_ui():
    var label = Label.new()
    label.text = "Get " + var_name
    add_child(label)

func execute(inputs):
    # Placeholder: return dummy value
    return {"Value": 0.0}
