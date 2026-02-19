extends Control

# Auto-generated: Full Unreal-style UI redesign for Godot 4.x
# Save as MainEditor.gd and attach to a Control root node in your scene

@onready var asset_browser = null
@onready var inspector_panel = null
@onready var blueprint_graph = null
@onready var output_log = null

func _ready():
    # Top Bar
    var top_bar = HBoxContainer.new()
    top_bar.name = "TopBar"
    var menu_bar = MenuBar.new()
    for menu in ["File", "Edit", "Tools", "Build", "Play"]:
        menu_bar.add_menu(menu)
    top_bar.add_child(menu_bar)
    for name in ["Save", "Play", "Build"]:
        var btn = Button.new()
        btn.text = name
        top_bar.add_child(btn)
    add_child(top_bar)

    # Main Area
    var main_area = HSplitContainer.new()
    main_area.name = "MainArea"
    main_area.size_flags_vertical = Control.SIZE_EXPAND_FILL

    # Left Dock: Asset Browser
    asset_browser = Tree.new()
    asset_browser.name = "AssetBrowser"
    asset_browser.custom_minimum_size = Vector2(220, 400)
    asset_browser.columns = 1
    asset_browser.hide_root = true
    _populate_asset_browser()
    asset_browser.connect("item_activated", self, "_on_asset_activated")
    asset_browser.connect("gui_input", self, "_on_asset_browser_gui_input")
    main_area.add_child(asset_browser)

    # Center Tabs: Viewport & Blueprint Graph
    var center_tabs = TabContainer.new()
    center_tabs.name = "CenterTabs"
    center_tabs.custom_minimum_size = Vector2(800, 600)
    var viewport = Control.new()
    viewport.name = "Viewport"
    center_tabs.add_child(viewport)
    blueprint_graph = GraphEdit.new()
    blueprint_graph.name = "Blueprint"
    blueprint_graph.connect("gui_input", self, "_on_graph_gui_input")
    blueprint_graph.connect("can_drop_data", self, "_on_graph_can_drop_data")
    blueprint_graph.connect("drop_data", self, "_on_graph_drop_data")
    center_tabs.add_child(blueprint_graph)
    main_area.add_child(center_tabs)

    # Right Dock: Inspector Panel
    inspector_panel = VBoxContainer.new()
    inspector_panel.name = "InspectorPanel"
    inspector_panel.custom_minimum_size = Vector2(250, 400)
    main_area.add_child(inspector_panel)
    add_child(main_area)

    # Bottom Dock: Output Log
    var bottom_dock = TabContainer.new()
    bottom_dock.name = "BottomDock"
    bottom_dock.custom_minimum_size = Vector2(800, 150)
    output_log = TextEdit.new()
    output_log.name = "OutputLog"
    output_log.readonly = true
    bottom_dock.add_child(output_log)
    add_child(bottom_dock)

    # Layout Anchors
    top_bar.anchor_right = 1
    main_area.anchor_bottom = 0.85
    main_area.anchor_right = 1
    main_area.margin_top = top_bar.rect_size.y
    bottom_dock.anchor_top = 0.85
    bottom_dock.anchor_right = 1
    bottom_dock.anchor_bottom = 1

func _populate_asset_browser():
    var root = asset_browser.create_item()
    var dir = DirAccess.open("res://")
    if dir:
        dir.list_dir_begin()
        var file = dir.get_next()
        while file != "":
            if file.begins_with("."):
                file = dir.get_next()
                continue
            var item = asset_browser.create_item(root)
            item.set_text(0, file)
            file = dir.get_next()
        dir.list_dir_end()


# Called when an asset is activated (double-clicked)
func _on_asset_activated():
    var item = asset_browser.get_selected()
    if item:
        output_log.text += "Activated asset: %s\n" % item.get_text(0)
        show_in_inspector(item)

# Drag-and-drop support for asset browser
func _on_asset_browser_gui_input(event):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
        var item = asset_browser.get_selected()
        if item:
            asset_browser.set_drag_preview(item.get_text(0))
            asset_browser.set_drag_data(item.get_text(0))

# Right-click context menu for node creation
func _on_graph_gui_input(event):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
        var menu = PopupMenu.new()
        menu.add_item("Add Node")
        menu.connect("id_pressed", self, "_on_graph_context_menu_selected", [event.position])
        blueprint_graph.add_child(menu)
        menu.popup_(Rect2(event.position, Vector2(0,0)))

func _on_graph_context_menu_selected(id, pos):
    var node = GraphNode.new()
    node.title = "Node"
    node.position_offset = pos
    node.set_slot(0, true, 1, Color.red, true, 1, Color.green)
    blueprint_graph.add_child(node)
    output_log.text += "Added node at %s\n" % str(pos)

# Drag-and-drop support for graph editor
func _on_graph_can_drop_data(position, data):
    return true

func _on_graph_drop_data(position, data):
    var node = GraphNode.new()
    node.title = data
    node.position_offset = position
    node.set_slot(0, true, 1, Color.red, true, 1, Color.green)
    blueprint_graph.add_child(node)
    output_log.text += "Dropped asset as node: %s at %s\n" % [data, str(position)]

# Dynamic inspector panel
func show_in_inspector(obj):
    inspector_panel.clear()
    for prop in obj.get_property_list():
        if prop.usage & PROPERTY_USAGE_EDITOR:
            var hbox = HBoxContainer.new()
            var label = Label.new()
            label.text = prop.name + ":"
            hbox.add_child(label)
            var value = LineEdit.new()
            value.text = str(obj.get(prop.name))
            value.editable = true
            value.connect("text_submitted", func(new_val): obj.set(prop.name, new_val))
            hbox.add_child(value)
            inspector_panel.add_child(hbox)
