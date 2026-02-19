# LogicOrNode.gd
# Blueprint node: Logical OR
extends "res://BlueprintNodeBase.gd"

func _init():
    node_title = "Or"
    input_pins = [{"name": "A", "type": PinType.BOOL}, {"name": "B", "type": PinType.BOOL}]
    output_pins = [{"name": "Result", "type": PinType.BOOL}]

func _build_ui():
    var label = Label.new()
    label.text = "A or B"
    add_child(label)

func execute(inputs):
    return {"Result": bool(inputs["A"]) or bool(inputs["B"])}
