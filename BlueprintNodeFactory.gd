# BlueprintNodeFactory.gd
# Utility to spawn custom blueprint nodes in the editor
extends Node

@export var blueprint_graph: GraphEdit

func create_blueprint_node(title: String, pos: Vector2, input_count: int = 1, output_count: int = 1):
    var node = preload("res://BlueprintNode.gd").new()
    node.node_title = title
    node.input_count = input_count
    node.output_count = output_count
    node.position_offset = pos
    blueprint_graph.add_child(node)
    return node
