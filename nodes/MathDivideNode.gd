# MathDivideNode.gd
# Blueprint node: Divide two numbers
extends "res://BlueprintNodeBase.gd"

func _init():
    node_title = "Divide"
    input_pins = [{"name": "A", "type": PinType.FLOAT}, {"name": "B", "type": PinType.FLOAT}]
    output_pins = [{"name": "Result", "type": PinType.FLOAT}]

func _build_ui():
    var label = Label.new()
    label.text = "A / B"
    add_child(label)

func execute(inputs):
    if float(inputs["B"]) == 0.0:
        return {"Result": 0.0}
    return {"Result": float(inputs["A"]) / float(inputs["B"])}
