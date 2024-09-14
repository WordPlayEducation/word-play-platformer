class_name UI extends MarginContainer

func _ready() -> void:
	%Entry.text_submitted.connect(_prompt_entered)

func _prompt_entered(word: String) -> void:
	%Entry.editable = false
	
	var word_object: WordObject = await Ref.creator.create_object(word)
	
	await Ref.placer.place(word_object)
	
	%Entry.editable = true