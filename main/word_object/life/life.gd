class_name Life extends WordObject

@export_enum("land", "air", "fluid") var movement_type: String = "land"
@export var activity: float = 0.1

var speed: float = 256.0
var move_dir: float = 1.0

func _ready() -> void:
	super._ready()
	flip()
	%Timer.timeout.connect(_on_timeout)

func _on_timeout() -> void:
	if %RayCast2D.is_colliding() or randf() < 0.2:
		flip()
	%Timer.start(randf_range(.5, 1.0))

func initialize() -> void:
	super.initialize()

func flip() -> void:
	move_dir *= -1
	%RayCast2D.target_position.x = (size.x + 6) * move_dir
	if randf() < 0.2:
		linear_velocity = Vector2()
	else:
		linear_velocity = Vector2(move_dir, 0.0) * speed *randf_range(0.5, 0.7)
