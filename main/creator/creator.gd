class_name Creator extends HTTPRequest

var fluid_type = preload("res://main/word_object/fluid/fluid.tscn")
var inanimate_solid_type = preload("res://main/word_object/inanimate_solid/inanimate_solid.tscn")
var life_type = preload("res://main/word_object/life/life.tscn")

func create_object(word: String) -> WordObject:
	var ai_response: Dictionary = {}
	var word_obj: WordObject = null
	
	if ai_response["type"] == "fluid":
		word_obj = fluid_type.instantiate()
		configure_fluid(word_obj, ai_response)
	elif ai_response["type"] == "inanimate_solid":
		word_obj = inanimate_solid_type.instantiate()
		configure_fluid(word_obj, ai_response)
	elif ai_response["type"] == "life":
		word_obj = life_type.instantiate()
		configure_fluid(word_obj, ai_response)
	
	return word_obj

func configure_fluid(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		if property == "type": pass

func configure_inanimate_object(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		if property == "type": pass
		elif property == "physics_type":
			obj.physics_type = ai_response["physics_type"]

func configure_life(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		if property == "type": pass
		elif property == "movement_type":
			obj.movement_type = ai_response["movement_type"]
