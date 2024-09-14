class_name InanimateSolid extends WordObject

@export_enum("mobile", "rigid") var physics_type: String = "mobile"

func initialize() -> void:
	super.initialize()
	
	match physics_type:
		"mobile":
			freeze = true
		"rigid":
			freeze = false
