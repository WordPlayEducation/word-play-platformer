class_name Fluid extends WordObject

func initialize() -> void:
	super.initialize()
	%Label.text = "[wave amp=40.0]" + %Label.text
