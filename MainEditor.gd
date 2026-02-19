extends Control

const EditorKernelScript = preload("res://editor_core/EditorKernel.gd")
const EditorTypesScript = preload("res://editor_core/EditorTypes.gd")

@onready var asset_browser: Tree = null
@onready var inspector_panel: VBoxContainer = null
@onready var blueprint_graph: GraphEdit = null
@onready var output_log: TextEdit = null
@onready var terminal_panel: Control = null
@onready var top_bar: HBoxContainer = null
@onready var main_area: HSplitContainer = null
@onready var bottom_dock: TabContainer = null
@onready var title_page: Control = null
@onready var splash_progress_bar: ProgressBar = null
@onready var splash_status_label: Label = null
@onready var enter_button: Button = null
@onready var quit_button: Button = null

var splash_progress := 0.0
var splash_done := false
var _kernel = null
var _menu_schema: Dictionary = {}

@onready var blueprint_factory = preload("res://BlueprintNodeFactory.gd").new()

func _ready() -> void:
	_bootstrap_editor_core()
	_build_shell_ui()
	_create_title_page()
	_set_editor_visible(false)
	set_process(true)
	_log("Editor shell started (Layout: %s)" % _kernel.layouts.get_active_layout())

func _process(delta: float) -> void:
	if splash_done:
		return

	splash_progress = min(splash_progress + delta * 33.0, 100.0)
	if splash_progress_bar:
		splash_progress_bar.value = splash_progress
	if splash_status_label:
		splash_status_label.text = "Loading... %d%%" % int(splash_progress)

	if splash_progress >= 100.0:
		splash_done = true
		if splash_status_label:
			splash_status_label.text = "Ready"
		if enter_button:
			enter_button.disabled = false
		if quit_button:
			quit_button.disabled = false

func _input(event: InputEvent) -> void:
	if not (event is InputEventKey and event.pressed):
		return

	if event.ctrl_pressed and event.keycode == KEY_S and not event.shift_pressed:
		_kernel.commands.execute_command("file.save")
	elif event.ctrl_pressed and event.shift_pressed and event.keycode == KEY_S:
		_kernel.commands.execute_command("file.save_all")
	elif event.ctrl_pressed and event.keycode == KEY_B:
		_kernel.commands.execute_command("build.all")
	elif event.keycode == KEY_F5:
		_kernel.commands.execute_command("play.pie")

func _bootstrap_editor_core() -> void:
	_kernel = EditorKernelScript.new()
	_kernel.bootstrap()
	_kernel.logs.message_logged.connect(_on_core_log)
	_kernel.layouts.layout_changed.connect(_on_layout_changed)
	_menu_schema = EditorTypesScript.menu_schema()
	_register_default_commands()

func _register_default_commands() -> void:
	var t = EditorTypesScript
	_kernel.commands.register_command(t.command_info("file.save", "Save"), callable(self, "_cmd_save"))
	_kernel.commands.register_command(t.command_info("file.save_all", "Save All"), callable(self, "_cmd_save_all"))
	_kernel.commands.register_command(t.command_info("build.all", "Build All"), callable(self, "_cmd_build_all"))
	_kernel.commands.register_command(t.command_info("play.pie", "Play In Editor"), callable(self, "_cmd_play"))
	_kernel.commands.register_command(t.command_info("window.layout_default", "Default Layout"), callable(self, "_cmd_layout_default"))
	_kernel.commands.register_command(t.command_info("window.layout_debug", "Debug Layout"), callable(self, "_cmd_layout_debug"))

func _build_shell_ui() -> void:
	# Top bar and primary menus.
	top_bar = HBoxContainer.new()
	top_bar.name = "TopBar"
	var menu_bar = MenuBar.new()
	for menu_name in _menu_schema.keys():
		menu_bar.add_menu(menu_name)
	top_bar.add_child(menu_bar)

	for action_name in ["Save", "Play", "Build All", "Layout: Default", "Layout: Debug"]:
		var btn = Button.new()
		btn.text = action_name
		btn.pressed.connect(_on_top_bar_action.bind(action_name))
		top_bar.add_child(btn)
	add_child(top_bar)

	# Workspace host.
	main_area = HSplitContainer.new()
	main_area.name = "MainArea"
	main_area.size_flags_vertical = Control.SIZE_EXPAND_FILL

	# Left dock: Outliner / Content Browser prototype.
	asset_browser = Tree.new()
	asset_browser.name = "ContentBrowser"
	asset_browser.custom_minimum_size = Vector2(260, 450)
	asset_browser.columns = 1
	asset_browser.hide_root = true
	_populate_asset_browser()
	asset_browser.item_activated.connect(_on_asset_activated)
	asset_browser.gui_input.connect(_on_asset_browser_gui_input)
	main_area.add_child(asset_browser)

	# Center tabs: Level / Blueprint editor prototypes.
	var center_tabs = TabContainer.new()
	center_tabs.name = "EditorTabs"
	center_tabs.custom_minimum_size = Vector2(900, 650)

	var viewport = Control.new()
	viewport.name = "LevelEditor"
	center_tabs.add_child(viewport)

	blueprint_graph = GraphEdit.new()
	blueprint_graph.name = "BlueprintEditor"
	blueprint_graph.gui_input.connect(_on_graph_gui_input)
	blueprint_graph.can_drop_data.connect(_on_graph_can_drop_data)
	blueprint_graph.drop_data.connect(_on_graph_drop_data)
	center_tabs.add_child(blueprint_graph)

	blueprint_factory.blueprint_graph = blueprint_graph
	main_area.add_child(center_tabs)

	# Right dock: Details panel prototype.
	inspector_panel = VBoxContainer.new()
	inspector_panel.name = "Details"
	inspector_panel.custom_minimum_size = Vector2(300, 450)
	main_area.add_child(inspector_panel)
	add_child(main_area)

	# Bottom dock: Output + terminal.
	bottom_dock = TabContainer.new()
	bottom_dock.name = "BottomDock"
	bottom_dock.custom_minimum_size = Vector2(900, 180)

	output_log = TextEdit.new()
	output_log.name = "OutputLog"
	output_log.readonly = true
	bottom_dock.add_child(output_log)

	terminal_panel = preload("res://TerminalPanel.gd").new()
	terminal_panel.name = "Terminal"
	bottom_dock.add_child(terminal_panel)
	add_child(bottom_dock)

	top_bar.anchor_right = 1
	main_area.anchor_bottom = 0.85
	main_area.anchor_right = 1
	main_area.margin_top = top_bar.rect_size.y
	bottom_dock.anchor_top = 0.85
	bottom_dock.anchor_right = 1
	bottom_dock.anchor_bottom = 1

func _create_title_page() -> void:
	title_page = Control.new()
	title_page.name = "TitlePage"
	title_page.anchor_left = 0
	title_page.anchor_top = 0
	title_page.anchor_right = 1
	title_page.anchor_bottom = 1
	add_child(title_page)

	var background = ColorRect.new()
	background.anchor_left = 0
	background.anchor_top = 0
	background.anchor_right = 1
	background.anchor_bottom = 1
	background.color = Color(0.06, 0.08, 0.12, 1.0)
	title_page.add_child(background)

	var center = VBoxContainer.new()
	center.anchor_left = 0.5
	center.anchor_top = 0.5
	center.anchor_right = 0.5
	center.anchor_bottom = 0.5
	center.position = Vector2(-240, -240)
	center.custom_minimum_size = Vector2(480, 480)
	center.alignment = BoxContainer.ALIGNMENT_CENTER
	title_page.add_child(center)

	var logo = TextureRect.new()
	logo.custom_minimum_size = Vector2(180, 180)
	logo.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	if ResourceLoader.exists("res://nexus_logo.png"):
		logo.texture = load("res://nexus_logo.png")
	elif ResourceLoader.exists("res://logo.png"):
		logo.texture = load("res://logo.png")
	center.add_child(logo)

	var title = Label.new()
	title.text = "NEXUS ENGINE"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 42)
	center.add_child(title)

	var subtitle = Label.new()
	subtitle.text = "Workspace Host / Modular Editor Shell"
	subtitle.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	subtitle.modulate = Color(0.75, 0.8, 0.9, 1.0)
	subtitle.add_theme_font_size_override("font_size", 16)
	center.add_child(subtitle)

	var spacer = Control.new()
	spacer.custom_minimum_size = Vector2(0, 18)
	center.add_child(spacer)

	splash_progress_bar = ProgressBar.new()
	splash_progress_bar.custom_minimum_size = Vector2(340, 24)
	splash_progress_bar.min_value = 0
	splash_progress_bar.max_value = 100
	splash_progress_bar.value = 0
	center.add_child(splash_progress_bar)

	splash_status_label = Label.new()
	splash_status_label.text = "Loading... 0%"
	splash_status_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	center.add_child(splash_status_label)

	var spacer2 = Control.new()
	spacer2.custom_minimum_size = Vector2(0, 10)
	center.add_child(spacer2)

	enter_button = Button.new()
	enter_button.text = "Enter Engine"
	enter_button.custom_minimum_size = Vector2(240, 44)
	enter_button.disabled = true
	enter_button.pressed.connect(_on_enter_editor_pressed)
	center.add_child(enter_button)

	quit_button = Button.new()
	quit_button.text = "Quit"
	quit_button.custom_minimum_size = Vector2(240, 40)
	quit_button.disabled = true
	quit_button.pressed.connect(_on_quit_pressed)
	center.add_child(quit_button)

func _set_editor_visible(is_visible: bool) -> void:
	if top_bar:
		top_bar.visible = is_visible
	if main_area:
		main_area.visible = is_visible
	if bottom_dock:
		bottom_dock.visible = is_visible

func _on_enter_editor_pressed() -> void:
	_set_editor_visible(true)
	_log("Entered workspace")
	if title_page:
		title_page.queue_free()
		title_page = null

func _on_quit_pressed() -> void:
	_log("Shutdown requested")
	get_tree().quit()

func _on_top_bar_action(action_name: String) -> void:
	match action_name:
		"Save":
			_kernel.commands.execute_command("file.save")
		"Play":
			_kernel.commands.execute_command("play.pie")
		"Build All":
			_kernel.commands.execute_command("build.all")
		"Layout: Default":
			_kernel.commands.execute_command("window.layout_default")
		"Layout: Debug":
			_kernel.commands.execute_command("window.layout_debug")

func _populate_asset_browser() -> void:
	var root = asset_browser.create_item()
	var dir = DirAccess.open("res://")
	if not dir:
		return
	dir.list_dir_begin()
	var file = dir.get_next()
	while file != "":
		if not file.begins_with("."):
			var item = asset_browser.create_item(root)
			item.set_text(0, file)
		file = dir.get_next()
	dir.list_dir_end()

func _on_asset_activated() -> void:
	var item = asset_browser.get_selected()
	if item:
		_log("Activated asset: %s" % item.get_text(0))
		show_in_inspector(item)

func _on_asset_browser_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var item = asset_browser.get_selected()
		if item:
			_log("Selected asset: %s" % item.get_text(0))

func _on_graph_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		var menu = PopupMenu.new()
		menu.add_item("Add Node")
		menu.add_item("Add Script Node")
		menu.id_pressed.connect(_on_graph_context_menu_selected.bind(event.position))
		blueprint_graph.add_child(menu)
		menu.popup(Rect2i(event.position, Vector2i(0, 0)))

func _on_graph_context_menu_selected(id: int, pos: Vector2) -> void:
	if id == 0:
		blueprint_factory.create_blueprint_node("Custom Node", pos, 1, 1)
		_log("Added blueprint node at %s" % str(pos))
	elif id == 1:
		var script_node = preload("res://BlueprintScriptNode.gd").new()
		script_node.node_title = "Script Node"
		script_node.position_offset = pos
		blueprint_graph.add_child(script_node)
		_log("Added script node at %s" % str(pos))

func _on_graph_can_drop_data(_position: Vector2, _data) -> bool:
	return true

func _on_graph_drop_data(position: Vector2, data) -> void:
	blueprint_factory.create_blueprint_node(str(data), position, 1, 1)
	_log("Dropped asset as blueprint node: %s at %s" % [str(data), str(position)])

func show_in_inspector(obj: Object) -> void:
	for child in inspector_panel.get_children():
		child.queue_free()

	for prop in obj.get_property_list():
		if int(prop.get("usage", 0)) & PROPERTY_USAGE_EDITOR:
			var hbox = HBoxContainer.new()
			var label = Label.new()
			var prop_name = str(prop.get("name", ""))
			label.text = "%s:" % prop_name
			hbox.add_child(label)
			var value = LineEdit.new()
			value.text = str(obj.get(prop_name))
			value.editable = true
			hbox.add_child(value)
			inspector_panel.add_child(hbox)

func _cmd_save() -> void:
	_log("Command: Save")

func _cmd_save_all() -> void:
	_log("Command: Save All")

func _cmd_build_all() -> void:
	_log("Command: Build All")

func _cmd_play() -> void:
	_log("Command: Play In Editor")

func _cmd_layout_default() -> void:
	_kernel.layouts.set_active_layout("Default")

func _cmd_layout_debug() -> void:
	_kernel.layouts.set_active_layout("Debug")

func _on_layout_changed(layout_name: String) -> void:
	_log("Layout switched to: %s" % layout_name)

func _on_core_log(level: String, message: String) -> void:
	if output_log:
		output_log.text += "[%s] %s\n" % [level, message]

func _log(message: String) -> void:
	if _kernel and _kernel.logs:
		_kernel.logs.log_info(message)
