class_name Life extends WordObject

@export_enum("land", "air", "fluid") var movement_type: String = "land"
@export var activity: float = 0.5

var speed: float = 256.0
var move_dir: float = 1.0

var vel: float

func _ready() -> void:
	super._ready()
	flip()
	%Timer.timeout.connect(_on_timeout)
	set_physics_process(false)

func _on_timeout() -> void:
	if %RayCast2D.is_colliding() or randf() < 0.2:
		flip()
	%Timer.start(randf_range(.5, 1.0))

func initialize() -> void:
	super.initialize()
	if activity <= 0.1:
		speed = 0
	else:
		speed = (activity * 0.8 + 0.8) * 256.0
	%CollisionShape2D3.shape = %CollisionShape2D.shape

func flip() -> void:
	move_dir *= -1
	%RayCast2D.target_position.x = (size.x + 6) * move_dir
	if randf() < 0.2:
		vel = 0
		
	else:
		vel = move_dir * speed *randf_range(0.5, 0.7)

func disable() -> void:
	%CollisionShape2D.disabled = true
	freeze = true
	sleeping = true

func enable() -> void:
	#nsakdjsakdkalsjdlk
	freeze = true
	sleeping = true
	set_physics_process(true)

func actual_move_to(new_position: Vector2) -> void:
	%B.global_position = new_position

var time: float

func _physics_process(delta: float) -> void:
	%B.velocity.x = lerp(%B.velocity.x, vel, 4.0 * delta)
	%B.move_and_slide()
	if not movement_type == "air":
		%B.velocity.y += 4000 * delta
	else:
		time += delta
		%B.velocity.y = 64.0 * sin(time * 8.0)
	if not placing:
		%Area2D.global_position = %B.global_position
