# BlueprintNodeBase.gd
# Base class for all blueprint nodes with typed pins and execution logic
extends GraphNode

enum PinType { EXEC, BOOL, INT, FLOAT, STRING, OBJECT }

class_name BlueprintNodeBase

@export var node_title: String = "Node"
@export var input_pins: Array = [] # Array of {name, type}
@export var output_pins: Array = [] # Array of {name, type}

var pin_values = {}

func _ready():
    self.title = node_title
    for i in range(input_pins.size()):
        var pin = input_pins[i]
        set_slot(i, true, pin.type, Color.blue, false, 0, Color())
    for i in range(output_pins.size()):
        var pin = output_pins[i]
        set_slot(input_pins.size() + i, false, 0, Color(), true, output_pins[i].type, Color.green)
    _build_ui()

func _build_ui():
    # Override in subclasses for custom controls
    pass

func execute(inputs):
    # Override in subclasses for node logic
    return {}
