class_name UI extends MarginContainer

var generating: bool = false

func _ready() -> void:
	%Entry.text_submitted.connect(_prompt_entered)

func _prompt_entered(word: String) -> void:
	if generating:
		return
	%Entry.release_focus()
	generating = true
	
	%Entry.editable = false
	
	var word_object: WordObject = await Ref.creator.create_object(word)
	
	if word_object:
		await Ref.placer.place(word_object)
	
	%Entry.editable = true
	generating = false
