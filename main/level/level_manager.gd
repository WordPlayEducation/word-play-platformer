class_name LevelManager extends Node

@export var levels: Array[PackedScene]

var current_id: int = 0
var loaded_level: Level

func _ready() -> void:
	load_level(0)

func load_level(id: int) -> void:
	Ref.player.global_position = Vector2()
	if is_instance_valid(loaded_level):
		loaded_level.queue_free()
	loaded_level = levels[id].instantiate()
	add_child(loaded_level)
	Ref.player.set_deferred("can_move", true)
	Ref.player.global_position = loaded_level.get_node("%Entrance").global_position

func end_level() -> void:
	Ref.player.can_move = false
	
	for object in %WordObjects.get_children():
		object.queue_free.call_deferred()
	
	current_id += 1
	load_level.call_deferred(current_id)
