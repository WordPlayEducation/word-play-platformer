class_name Creator extends HTTPRequest

var fluid_type = preload("res://main/word_object/fluid/fluid.tscn")
var inanimate_solid_type = preload("res://main/word_object/inanimate_solid/inanimate_solid.tscn")
var life_type = preload("res://main/word_object/life/life.tscn")

var i: int =  0

signal data_gotten(data: Variant)
signal data_gotten2(data: Variant)

func _ready() -> void:
	request_completed.connect(_on_request_completed)
	%Asker.request_completed.connect(_on_request_completed2)

func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json: JSON = JSON.new()
	json.parse(body.get_string_from_utf8())
	data_gotten.emit(json.data)

func _on_request_completed2(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json: JSON = JSON.new()
	json.parse(body.get_string_from_utf8())
	data_gotten2.emit(json.data)

func create_object(word: String) -> WordObject:
	request("http://127.0.0.1:5000/classify_object?user_prompt=\"%s\"" % word)
	var ai_response: Variant = await data_gotten
	print(ai_response)
	
	if not ai_response or len(ai_response) <= 1:
		return null
	
	var word_obj: WordObject = null
	if not ("type" in ai_response or "Type" in ai_response): return null
	
	# Instantiating and adding type specific properties to the word object
	var type: String
	if "Type" in ai_response:
		type = ai_response["Type"]
	elif "type" in ai_response:
		type = ai_response["type"]
	else:
		type = "inanimate_solid"
	type = type.replace(" ", "_")
	match type:
		"fluid":
			word_obj = fluid_type.instantiate()
			configure_fluid(word_obj, ai_response)
		"inanimate_solid":
			word_obj = inanimate_solid_type.instantiate()
			configure_inanimate_object(word_obj, ai_response)
		"life":
			word_obj = life_type.instantiate()
			configure_life(word_obj, ai_response)
		_:
			word_obj = inanimate_solid_type.instantiate()
			configure_inanimate_object(word_obj, ai_response)
		

	
	# Adding non-type specific properties
	for property in ai_response:
		var value: String = ai_response[property]
		
		property = clean_string(property)
		
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
		
		property = clean_string(property)
		
		match property:
			"viscosity":
				if not value.is_valid_float(): break
				obj.viscosity = clamp(float(value), 0.0, 1.0)

# Adding inanimate object specific properties
func configure_inanimate_object(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		var value = ai_response[property]
		
		property = clean_string(property)
		
		# Type specific properties
		match property:
			"physics_type":
				if value not in ["mobile", "rigid"]: break
				obj.physics_type = value

# Adding life specific properties
func configure_life(obj: WordObject, ai_response: Dictionary):
	for property in ai_response:
		var value = ai_response[property]
		
		property = clean_string(property)
		
		# Type-specific properties
		match property:
			"movement_type":
				if value not in ["land", "air", "fluid"]: break
				obj.movement_type = value
			"activity":
				if not value.is_valid_float(): break
				obj.activity = clamp(float(value), 0.0, 1.0)

func clean_string(s: String) -> String:
	return s.replace(" ", "_").to_lower()

func ask(question: String, answer: String) -> bool:
	print(question, " " ,answer)
	%Asker.request("http://127.0.0.1:5000/binary_question?level_prompt=\"%s\"&user_prompt=\"%s\"" % [question, answer])
	var ai_response: Variant = await data_gotten2
	print(ai_response)
	if "binary_response" in ai_response:
		return ai_response["binary_response"]
	return false
