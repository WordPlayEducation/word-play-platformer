class_name UI extends MarginContainer

var generating: bool = false

func _ready() -> void:
	%Button.pressed.connect(_prompt_entered)

func _prompt_entered() -> void:
	%ClickPlayer.play()
	%Button.disabled = true
	if generating:
		return
	%Entry.release_focus()
	generating = true
	
	%Entry.editable = false
	
	var word_object: WordObject = await Ref.creator.create_object(%Entry.text)
	
	if word_object:
		await Ref.placer.place(word_object)
	else:
		%ErrorPlayer.play()
	
	%Entry.editable = true
	%Button.disabled = false
	generating = false
