extends GraphNode

# Example of a custom Blueprint node for the visual scripting system

@export var node_title: String = "Custom Node"
@export var input_count: int = 1
@export var output_count: int = 1

func _ready():
    self.title = node_title
    for i in range(input_count):
        set_slot(i, true, 1, Color.red, false, 0, Color())
    for i in range(output_count):
        set_slot(input_count + i, false, 0, Color(), true, 1, Color.green)

    var label = Label.new()
    label.text = "Logic here"
    add_child(label)

    # Add more controls as needed for node parameters
