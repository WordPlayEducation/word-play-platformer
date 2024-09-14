class_name LevelManager extends Node

@export var levels: Array[PackedScene]

var current_id: int = 0
var loaded_level: Level

func _ready() -> void:
	load_level(0)

func load_level(id: int) -> void:
	if is_instance_valid(loaded_level):
		loaded_level.queue_free()
	loaded_level = levels[id].instantiate()
	add_child(loaded_level)
