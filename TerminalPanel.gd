# TerminalPanel.gd
# In-editor terminal for command/script execution
extends VBoxContainer

@onready var output_log = null
@onready var input_line = null

func _ready():
    output_log = TextEdit.new()
    output_log.readonly = true
    output_log.size_flags_vertical = Control.SIZE_EXPAND_FILL
    output_log.custom_minimum_size = Vector2(600, 120)
    add_child(output_log)

    input_line = LineEdit.new()
    input_line.placeholder_text = "Enter command or script..."
    input_line.text_submitted.connect(_on_command_entered)
    add_child(input_line)

func _on_command_entered(cmd: String):
    output_log.text += "> %s\n" % cmd
    # Example: Evaluate as GDScript (sandboxed)
    var result = "[Not implemented: script eval]"
    output_log.text += "%s\n" % result
    input_line.text = ""
