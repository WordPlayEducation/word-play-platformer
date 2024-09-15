class_name InanimateSolid extends WordObject

@export_enum("mobile", "rigid") var physics_type: String = "mobile"
@export var slippery: float

func _ready() -> void:
	super._ready()

func initialize() -> void:
	super.initialize()
	
	match physics_type:
		"mobile":
			pass
		"rigid":
			gravity_scale = 0
			mass = 999999999999
			linear_damp = 100
