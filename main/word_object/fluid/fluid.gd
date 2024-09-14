class_name Fluid extends WordObject

func initialize() -> void:
	super.initialize()
	%Label.text = "[wave]" + %Label.text
	%CollisionShape2D.disabled = true
