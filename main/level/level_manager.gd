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
	
	await Ref.trans.trans_out()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("reset") and not Ref.placer.placing:
		end_level(false)

func end_level(next: bool = true) -> void:
	Ref.player.can_move = false
	
	await Ref.trans.trans_in()
	
	for object in %WordObjects.get_children():
		object.queue_free.call_deferred()
	

	
	if next:
		current_id += 1
	if current_id >= len(levels):
		current_id = 0
	load_level.call_deferred(current_id)
