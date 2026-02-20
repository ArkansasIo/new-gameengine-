func _ready():
	modeling_btn.pressed.connect(_on_modeling_pressed)
	landscape_btn.pressed.connect(_on_landscape_pressed)
	foliage_btn.pressed.connect(_on_foliage_pressed)
	menu_search.text_changed.connect(_on_menu_search)
	_populate_menus()
	tools_menu.get_popup().id_pressed.connect(_on_tools_menu_item)

func _on_tools_menu_item(id):
	var item_text = tools_menu.get_popup().get_item_text(id)
	if item_text == "Compile":
		_run_compile()

func _run_compile():
	var compile_bar = $StatusBar/CompileBar
	compile_bar.text = "Compile Status: Compiling..."
	# Simulate compile (replace with real logic)
	await get_tree().create_timer(1.5).timeout
	compile_bar.text = "Compile Status: Success! Running..."
	_run_blueprint()

func _run_blueprint():
	# Simulate run (replace with real logic)
	await get_tree().create_timer(1.0).timeout
	$StatusBar/CompileBar.text = "Compile Status: Run Complete!"
func _input(event):
	# Keyboard navigation for menu bar
	if event is InputEventKey and event.pressed:
		if event.alt:
			match event.scancode:
				KEY_F:
					file_menu.show_popup()
				KEY_E:
					edit_menu.show_popup()
				KEY_V:
					view_menu.show_popup()
				KEY_T:
					tools_menu.show_popup()
				KEY_H:
					help_menu.show_popup()
		elif event.scancode == KEY_F and event.control and event.shift:
			menu_search.grab_focus()
		# Arrow keys, Enter, Escape for menu navigation
		var menus = [file_menu, edit_menu, view_menu, tools_menu, help_menu]
		for menu in menus:
			if menu.get_popup().is_visible():
				if event.scancode == KEY_DOWN:
					menu.get_popup().select(menu.get_popup().get_selected() + 1)
				elif event.scancode == KEY_UP:
					menu.get_popup().select(menu.get_popup().get_selected() - 1)
				elif event.scancode == KEY_ENTER:
					menu.get_popup().activate_item(menu.get_popup().get_selected())
				elif event.scancode == KEY_ESCAPE:
					menu.get_popup().hide()

extends Panel

# Modes Panel UI logic

@onready var modeling_btn = $HBoxContainer/ModelingButton
@onready var landscape_btn = $HBoxContainer/LandscapeButton
@onready var foliage_btn = $HBoxContainer/FoliageButton
@onready var menu_search = $MenuBar/MenuSearch
@onready var file_menu = $MenuBar/FileMenu
@onready var edit_menu = $MenuBar/EditMenu
@onready var view_menu = $MenuBar/ViewMenu
@onready var tools_menu = $MenuBar/ToolsMenu
@onready var help_menu = $MenuBar/HelpMenu

var all_menu_items = {
	"File": ["New Blueprint", "Open Blueprint", "Open Recent", "Save", "Save As", "Save All", "Import", "Export", "Print", "Close", "Exit"],
	"Edit": ["Undo", "Redo", "Cut", "Copy", "Paste", "Duplicate", "Delete", "Select All", "Deselect All", "Find", "Find & Replace"],
	"View": ["Zoom In", "Zoom Out", "Zoom to Fit", "Reset Zoom", "Show Grid", "Show Mini Map", "Show Toolbar", "Panels", "Layout", "Theme"],
	"Tools": ["Compile", "Analysis", "Alignment", "Batch Operations", "Debug Mode", "AI Assistant", "Preferences"],
	"Help": ["Welcome Guide", "Documentation", "Help Topics", "Keyboard Shortcuts", "Tips & Tricks", "Community", "Support", "About", "Check for Updates"]
}

func _ready():
	modeling_btn.pressed.connect(_on_modeling_pressed)
	landscape_btn.pressed.connect(_on_landscape_pressed)
	foliage_btn.pressed.connect(_on_foliage_pressed)
	menu_search.text_changed.connect(_on_menu_search)
	_populate_menus()

func _populate_menus():
	# Example: Populate File menu with items
	file_menu.get_popup().clear()
	for item in all_menu_items["File"]:
		file_menu.get_popup().add_item(item)
	# Repeat for other menus
	edit_menu.get_popup().clear()
	for item in all_menu_items["Edit"]:
		edit_menu.get_popup().add_item(item)
	view_menu.get_popup().clear()
	for item in all_menu_items["View"]:
		view_menu.get_popup().add_item(item)
	tools_menu.get_popup().clear()
	for item in all_menu_items["Tools"]:
		tools_menu.get_popup().add_item(item)
	help_menu.get_popup().clear()
	for item in all_menu_items["Help"]:
		help_menu.get_popup().add_item(item)

func _on_menu_search(new_text):
	var query = new_text.to_lower()
	# Filter menu items based on search
	for menu_name in all_menu_items.keys():
		var menu_btn = $MenuBar.get_node(menu_name + "Menu")
		var popup = menu_btn.get_popup()
		popup.clear()
		for item in all_menu_items[menu_name]:
			if query == "" or item.to_lower().find(query) != -1:
				popup.add_item(item)

func _on_modeling_pressed():
	print("Modeling mode activated")

func _on_landscape_pressed():
	print("Landscape mode activated")

func _on_foliage_pressed():
	print("Foliage mode activated")
