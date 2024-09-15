class_name Fluid extends WordObject

func initialize() -> void:
	size_and_shape = "big"
	super.initialize()
	%Label.text = "[wave amp=40.0]" + %Label.text
