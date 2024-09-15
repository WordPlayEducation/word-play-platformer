class_name Player extends CharacterBody2D
# https://kidscancode.org/godot_recipes/4.x/2d/platform_character/index.html
# https://kidscancode.org/godot_recipes/4.x/physics/character_vs_rigid/index.html

@export var speed = 1200
@export var jump_speed = -1800
@export var gravity = 4000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0, 1.0) var acceleration = 0.25
@export var push_force: float = 80.0

var can_move: bool = true
var double_jump: bool = false

func _physics_process(delta: float) -> void:
	if not can_move:
		return
	velocity.y += gravity * delta
	var dir: float = Input.get_axis("ui_left", "ui_right")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)
	
	%Sprite2D.rotation = lerp(%Sprite2D.rotation, 0.15 * sign(dir), delta * 16.0)
	
	move_and_slide()
	if Input.is_action_just_pressed("jump") and (double_jump or is_on_floor()):
		velocity.y = jump_speed
		%JumpPlayer.play()
	for i in get_slide_collision_count():
		var c: KinematicCollision2D = get_slide_collision(i)
		
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
