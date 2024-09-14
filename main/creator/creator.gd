class_name Creator extends HTTPRequest

var fluid_type = preload("res://main/word_object/fluid/fluid.tscn")
var inanimate_solid_type = preload("res://main/word_object/inanimate_solid/inanimate_solid.tscn")
var life_type = preload("res://main/word_object/life/life.tscn")

func create_object(word: String) -> WordObject:
	var ai_response: Dictionary = {}
	var word_obj: WordObject = null
	
	# Instantiating and adding type specific properties to the word object
	if ai_response["type"] == "fluid":
		word_obj = fluid_type.instantiate()
		configure_fluid(word_obj, ai_response)
	elif ai_response["type"] == "inanimate_solid":
		word_obj = inanimate_solid_type.instantiate()
		configure_fluid(word_obj, ai_response)
	elif ai_response["type"] == "life":
		word_obj = life_type.instantiate()
		configure_fluid(word_obj, ai_response)
	else:
		return null
	
	# Adding non-type specific properties
	for property in ai_response:
		if property == "text":
			word_obj.text = ai_response["text"]
		elif property == "dynamic":
			word_obj.dynamic = float(ai_response["dynamic"])
		elif property == "color":
			word_obj.color = Color(ai_response["color"])
		elif property == "sub_color":
			word_obj.color = Color(ai_response["sub_color"])
		
	return word_obj

# Adding fluid specific properties
func configure_fluid(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		pass

# Adding inanimate object specific properties
func configure_inanimate_object(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		if property == "physics_type":
			obj.physics_type = ai_response["physics_type"]

# Adding life specific properties
func configure_life(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		if property == "movement_type":
			obj.movement_type = ai_response["movement_type"]
