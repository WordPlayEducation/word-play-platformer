class_name Creator extends HTTPRequest

var fluid_type = preload("res://main/word_object/fluid/fluid.tscn")
var inanimate_solid_type = preload("res://main/word_object/inanimate_solid/inanimate_solid.tscn")
var life_type = preload("res://main/word_object/life/life.tscn")

var i: int =  0

func create_object(word: String) -> WordObject:
	var ai_response: Dictionary = TestCases.retrieve()[i]
	word = ai_response.text
	
	i += 1
	
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
		var value: String = ai_response[property]
		
		# Non-specific properties
		match property:
			"dynamic":
				if not value.is_valid_float(): break
				word_obj.dynamic = float(value)
			"color":
				if not value.substr(1).is_valid_hex_number(): 
					break
				word_obj.color = Color(value)
			"sub_color":
				if not value.is_valid_hex_number(): break
				word_obj.sub_color = Color(value)
			"size":
				if value not in ["wide", "tall", "small", "big"]: break
				word_obj.size_and_shape = value
	word_obj.text = word
	return word_obj


# Adding fluid specific properties <- Fluid empty as of now. Planning to add other properties.
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
			"physics_type":
				if value not in ["mobile", "rigid"]: break
				obj.physics_type = value

# Adding life specific properties
func configure_life(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		var value = ai_response[property]
		
		# Type-specific properties
		match property:
			"movement_type":
				if value not in ["land", "air", "fluid"]: break
				obj.movement_type = value
