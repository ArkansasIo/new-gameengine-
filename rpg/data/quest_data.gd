# quest_data.gd
# Data model for RPG quests
extends Resource
class_name QuestData

@export var name: String = ""
@export var quest_type: String = ""
@export var reward: String = ""
@export var progress: int = 0
@export var completed: bool = false

func to_dict() -> Dictionary:
	return {
		"name": name,
		"quest_type": quest_type,
		"reward": reward,
		"progress": progress,
		"completed": completed
	}

func from_dict(data: Dictionary):
	name = data.get("name", "")
	quest_type = data.get("quest_type", "")
	reward = data.get("reward", "")
	progress = data.get("progress", 0)
	completed = data.get("completed", false)
