# MathSubtractNode.gd
# Blueprint node: Subtract two numbers
extends "res://BlueprintNodeBase.gd"

func _init():
    node_title = "Subtract"
    input_pins = [{"name": "A", "type": PinType.FLOAT}, {"name": "B", "type": PinType.FLOAT}]
    output_pins = [{"name": "Result", "type": PinType.FLOAT}]

func _build_ui():
    var label = Label.new()
    label.text = "A - B"
    add_child(label)

func execute(inputs):
    return {"Result": float(inputs["A"]) - float(inputs["B"])}
