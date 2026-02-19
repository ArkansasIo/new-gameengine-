# EventStartNode.gd
# Blueprint node: Event Start (entry point)
extends "res://BlueprintNodeBase.gd"

func _init():
    node_title = "Event Start"
    input_pins = []
    output_pins = [{"name": "Exec", "type": PinType.EXEC}]

func _build_ui():
    var label = Label.new()
    label.text = "Start"
    add_child(label)

func execute(inputs):
    return {"Exec": true}
