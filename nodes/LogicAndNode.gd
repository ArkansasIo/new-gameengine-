# LogicAndNode.gd
# Blueprint node: Logical AND
extends "res://BlueprintNodeBase.gd"

func _init():
    node_title = "And"
    input_pins = [{"name": "A", "type": PinType.BOOL}, {"name": "B", "type": PinType.BOOL}]
    output_pins = [{"name": "Result", "type": PinType.BOOL}]

func _build_ui():
    var label = Label.new()
    label.text = "A and B"
    add_child(label)

func execute(inputs):
    return {"Result": bool(inputs["A"]) and bool(inputs["B"])}
