# network_data.gd
# Data model for RPG network/server settings
extends Resource
class_name NetworkData

@export var name: String = ""
@export var ip: String = "127.0.0.1"
@export var port: int = 7777
@export var max_players: int = 100
@export var motd: String = "Welcome!"

func to_dict() -> Dictionary:
	return {
		"name": name,
		"ip": ip,
		"port": port,
		"max_players": max_players,
		"motd": motd
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	ip = data.get("ip", "127.0.0.1")
	port = data.get("port", 7777)
	max_players = data.get("max_players", 100)
	motd = data.get("motd", "Welcome!")
