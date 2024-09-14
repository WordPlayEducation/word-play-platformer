class_name Creator extends HTTPRequest

var fluid_type = preload("res://main/word_object/fluid/fluid.tscn")
var inanimate_solid_type = preload("res://main/word_object/inanimate_solid/inanimate_solid.tscn")
var life_type = preload("res://main/word_object/life/life.tscn")
	

func create_object(word: String) -> WordObject:
	var ai_response: Dictionary = {}
	var word_obj: WordObject = null
	if "type" not in ai_response: return null
	
	# Instantiating and adding type specific properties to the word object
	match ai_response["type"]:
		"fluid":
			word_obj = fluid_type.instantiate()
			configure_fluid(word_obj, ai_response)
		"inanimate_solid":
			word_obj = inanimate_solid_type.instantiate()
			configure_inanimate_object(word_obj, ai_response)
		"life":
			word_obj = life_type.instantiate()
			configure_life(word_obj, ai_response)

	
	# Adding non-type specific properties
	for property in ai_response:
		var value = ai_response[property]
		
		# Non-specific properties
		match property:
			"text":
				word_obj.text = ai_response["text"]
			"dynamic":
				word_obj.dynamic = ai_response["dynamic"]
			"color":
				word_obj.color = Color(ai_response["color"])
			"sub_color":
				word_obj.sub_color = Color(ai_response["sub_color"])
		
	return word_obj


# Adding fluid specific properties
func configure_fluid(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		var value = ai_response[property]
		
		pass

# Adding inanimate object specific properties
func configure_inanimate_object(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		var value = ai_response[property]
		
		# Type specific properties
		match property:
			"physics:type":
				obj.physics_type = value

# Adding life specific properties
func configure_life(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		var value = ai_response[property]
		
		# Type-specific properties
		match property:
			"movement_type":
				obj.movement_type = value
