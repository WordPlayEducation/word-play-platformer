class_name Fluid extends WordObject

@export var viscosity: float

func _ready() -> void:
	%LiquidArea.body_entered.connect(_on_body_entered)
	%LiquidArea.body_exited.connect(_on_body_exited)
	%Sprite2D.material = %Sprite2D.material.duplicate()

func initialize() -> void:
	size_and_shape = "very_big"
	super.initialize()
	%Sprite2D.material.set_shader_parameter("viscosity", viscosity)
	%Label.text = "[wave amp=40.0]" + %Label.text

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.gravity *= 0.12
		body.speed *= 0.7
		body.jump_speed *= 0.3
		body.double_jump = true
		body.velocity.y = max(body.velocity.y, body.jump_speed)

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		body.gravity /= 0.12
		body.speed /= 0.7
		body.jump_speed /= 0.3
		body.double_jump = false
