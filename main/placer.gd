class_name Placer extends Node
# places down objects

signal placed

var target: WordObject

func place(word_object: WordObject) -> void:
	%WordObjects.add_child(word_object)
	word_object.initialize()
	word_object.disable()
	
	target = word_object
	
	target.placing = true
	target.global_position = Vector2(-1000, -1000)
	var first_place: bool = true
	while first_place or len(target.colliding) > 0:
		first_place = false
		await placed
	
	target.actual_move_to(target.get_node("%Area2D").global_position)
	target.placing = false
	target = null
	
	word_object.enable()
	word_object.spawn()

func _physics_process(delta: float) -> void:
	if is_instance_valid(target):
		target.move_to(get_viewport().get_mouse_position())

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("place"):
		placed.emit()
