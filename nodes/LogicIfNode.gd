# LogicIfNode.gd
# Blueprint node: If/Else logic
extends "res://BlueprintNodeBase.gd"

func _init():
    node_title = "If"
    input_pins = [{"name": "Condition", "type": PinType.BOOL}]
    output_pins = [{"name": "True", "type": PinType.EXEC}, {"name": "False", "type": PinType.EXEC}]

func _build_ui():
    var label = Label.new()
    label.text = "If Condition"
    add_child(label)

func execute(inputs):
    if bool(inputs["Condition"]):
        return {"True": true}
    else:
        return {"False": true}
