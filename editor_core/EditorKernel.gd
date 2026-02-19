extends RefCounted
class_name EditorKernel

var app: EditorApp
var commands: CommandService
var layouts: LayoutService
var selection: SelectionService
var logs: LogService
var types: EditorTypes

func bootstrap() -> void:
	app = EditorApp.new()
	commands = CommandService.new()
	layouts = LayoutService.new()
	selection = SelectionService.new()
	logs = LogService.new()
	types = EditorTypes.new()
	app.initialize(EditorTypes.app_config("Test Game Engine"))
