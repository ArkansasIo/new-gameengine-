extends RefCounted
class_name EditorTypes

static func command_info(id: String, label: String, tooltip: String = "", shortcut: String = "", context: String = "global") -> Dictionary:
	return {
		"id": id,
		"label": label,
		"tooltip": tooltip,
		"shortcut": shortcut,
		"context": context,
	}

static func app_config(project_name: String = "Test Game Engine") -> Dictionary:
	return {
		"project_name": project_name,
		"recent_projects": [],
		"last_layout": "Default",
	}

static func selection_set(kind: int, ids: Array = [], primary_id: String = "") -> Dictionary:
	return {
		"kind": kind,
		"ids": ids,
		"primary_id": primary_id,
	}

static func viewport_state(mode: int, camera_pos: Vector3 = Vector3.ZERO) -> Dictionary:
	return {
		"mode": mode,
		"camera_pos": camera_pos,
		"grid_snap": true,
		"angle_snap": true,
	}

static func menu_schema() -> Dictionary:
	       return {
		       "File": [
			       "file.new_level",
			       "file.open_level",
			       "file.save",
			       "file.save_all",
			       "file.import",
			       "file.export",
			       "file.exit",
		       ],
		       "Edit": [
			       "edit.undo",
			       "edit.redo",
			       "edit.copy",
			       "edit.paste",
			       "edit.delete",
		       ],
		       "Window": [
			       "window.layout_default",
			       "window.layout_debug",
			       "window.content_browser",
			       "window.outliner",
			       "window.details",
			       "window.output_log",
		       ],
		       "Tools": [
			       "tools.modeling",
			       "tools.landscape",
			       "tools.blueprint",
			       "tools.automation",
		       ],
		       "Build": [
			       "build.lighting",
			       "build.navigation",
			       "build.shaders",
			       "build.all",
		       ],
		       "Play": [
			       "play.pie",
			       "play.simulate",
			       "play.standalone",
		       ],
		       "RPG/MMO": [
			       "rpg.character_creator",
			       "rpg.inventory_equipment",
			       "rpg.skills_abilities",
			       "rpg.quest_dialogue",
			       "rpg.world_map",
			       "rpg.enemy_npc",
			       "rpg.item_drop_table",
			       "rpg.faction_guild",
			       "rpg.party_raid",
			       "rpg.combat_ai",
			       "rpg.economy_shop",
			       "rpg.network_server",
			       "rpg.save_load_export",
		       ],
		       "Help": [
			       "help.docs",
			       "help.about",
		       ],
	       }
